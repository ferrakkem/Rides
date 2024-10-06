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
    // Default sorting by VIN
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
    func fetchVehicles() {
        guard !isLoading else { return }
        // Check for network connection
        guard networkMonitor.isConnected else {
            showNetworkAlert = true
            return
        }
        isLoading = true
        apiService.fetchVehicles()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                case .finished:
                    self.errorMessage = nil
                }
                self.isLoading = false
            }, receiveValue: { newVehicle in
                self.vehicles.append(newVehicle)
                self.totalFetchedCount += 1
                self.currentPage += 1
                // Apply sorting after fetching
                self.sortVehicles()
            })
            .store(in: &cancellables)
    }
    // Check if vehicle list is empty
    func isVehicleListEmpty() -> Bool {
        return vehicles.isEmpty && errorMessage == nil
    }
    // Open app settings when there is no internet connection
    func goToSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url)
        }
    }
    // Fetch more vehicles if needed (for lazy loading)
    func fetchMoreVehiclesIfNeeded(currentVehicle: Vehicle) {
        guard let lastVehicle = vehicles.last, currentVehicle == lastVehicle else { return }
        fetchVehicles()
    }
    // Sort vehicles based on user selection
    func sortVehicles() {
        if sortByVin {
            vehicles.sort(by: { $0.vin < $1.vin })
        } else {
            vehicles.sort(by: { $0.car_type < $1.car_type })
        }
    }
}
