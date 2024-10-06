//
//  VehicleListViewModel.swift
//  Rides
//
//  Created by Ferrakkem Bhuiyan on 2024-10-04.
//

import Foundation
import Combine
import SwiftUI

class VehicleListViewModel: ObservableObject {
    @Published var vehicles: [Vehicle] = []
    @Published var errorMessage: String?
    @Published var sortByVin: Bool = true
    @Published var showNetworkAlert: Bool = false
    
    private let apiService: VehicleService
    private let networkMonitor: NetworkMonitor
    private var cancellables = Set<AnyCancellable>()
    private var isLoading = false
    private var currentPage = 1
    private var totalFetchedCount = 0
    
    init(apiService: VehicleService = VehicleService.shared, networkMonitor: NetworkMonitor = NetworkMonitor()) {
        self.apiService = apiService
        self.networkMonitor = networkMonitor
        observeNetwork()
    }
    
    // Validate input and fetch vehicles
    func validateAndFetchVehicles(searchText: String) {
        if let count = Int(searchText), (1...100).contains(count) {
            errorMessage = nil
            resetList()
            fetchVehicles(count: count)
        } else {
            errorMessage = VehicleListViewStrings.invalidInputMessage
        }
    }
    
    func resetList() {
        vehicles.removeAll()
        currentPage = 1
        totalFetchedCount = 0
    }
    
    private func observeNetwork() {
        networkMonitor.$isConnected
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isConnected in
                if !isConnected {
                    self?.showNetworkAlert = true
                }
            }
            .store(in: &cancellables)
    }
    
    func fetchVehicles(count: Int = 10) {
        guard !isLoading else { return }
        guard networkMonitor.isConnected else {
            showNetworkAlert = true
            return
        }
        isLoading = true
        apiService.fetchVehicles(count: count)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                case .finished:
                    self.errorMessage = nil
                }
                self.isLoading = false
            }, receiveValue: { newVehicles in
                self.vehicles.append(contentsOf: newVehicles)
                self.totalFetchedCount += newVehicles.count
                self.currentPage += 1
                self.sortVehicles()
            })
            .store(in: &cancellables)
    }
    
    func isVehicleListEmpty() -> Bool {
        return vehicles.isEmpty && errorMessage == nil
    }
    
    func goToSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url)
        }
    }
    
    func fetchMoreVehiclesIfNeeded(currentVehicle: Vehicle) {
        guard let lastVehicle = vehicles.last, currentVehicle == lastVehicle else { return }
        fetchVehicles(count: 10)
    }
    
    func sortVehicles() {
        if sortByVin {
            vehicles.sort(by: { $0.vin < $1.vin })
        } else {
            vehicles.sort(by: { $0.car_type < $1.car_type })
        }
    }
}

