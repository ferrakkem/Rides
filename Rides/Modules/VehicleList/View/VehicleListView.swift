//
//  VehicleListView.swift
//  Rides
//
//  Created by Ferrakkem Bhuiyan on 2024-10-04.
//

import SwiftUI

struct VehicleListView: View {
    @StateObject private var viewModel = VehicleListViewModel()
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SortingPickerView(sortByVin: $viewModel.sortByVin, onSortChange: {
                    viewModel.sortVehicles()
                })
                
                // Validation Error Message
                ErrorMessageView(errorMessage: viewModel.errorMessage)
                
                // If no data, show NoDataView
                if viewModel.isVehicleListEmpty() {
                    NoDataView()
                } else {
                    // Use the new custom scroll view component
                    VehicleListScrollView(vehicles: viewModel.vehicles, onAppear: { vehicle in
                        viewModel.fetchMoreVehiclesIfNeeded(currentVehicle: vehicle)
                    })
                }
            }
            .padding()
            .navigationTitle(VehicleListViewStrings.navigationTitle)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        viewModel.fetchVehicles()
                    }) {
                        Image(systemName: "arrow.down.circle.fill") // Download icon
                    }
                }
            }
            .searchable(text: $searchText, prompt: VehicleListViewStrings.fetchDataPrompt)
            .onSubmit(of: .search) {
                viewModel.fetchVehicles()
            }
            .alert(isPresented: $viewModel.showNetworkAlert) {
                Alert(
                    title: Text(VehicleListViewStrings.noInternetConnection),
                    message: Text(VehicleListViewStrings.enableWiFiMessage),
                    primaryButton: .default(Text(VehicleListViewStrings.goToSettings)) {
                        viewModel.goToSettings()
                    },
                    secondaryButton: .cancel(Text(VehicleListViewStrings.cancel))
                )
            }
        }
    }
}
#Preview {
    VehicleListView()
}
