//
//  VehicleListScrollView.swift
//  Rides
//
//  Created by Ferrakkem Bhuiyan on 2024-10-04.
//

import SwiftUI

struct VehicleListScrollView: View {
    let vehicles: [Vehicle]
    let onAppear: (Vehicle) -> Void
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(vehicles) { vehicle in
                    NavigationLink(destination: VehicleDetailView(vehicle: vehicle)) {
                        VehicleCardView(vehicle: vehicle)
                    }
                    .onAppear {
                        onAppear(vehicle)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
#Preview {
    VehicleListScrollView(
        vehicles: [
            Vehicle(
                make_and_model: "Toyota Camry",
                vin: "123ABC456XYZ789",
                car_type: "Sedan",
                color: "Red"
            ),
            Vehicle(make_and_model: "Honda Civic",
                    vin: "987XYZ654ABC321",
                    car_type: "Coupe",
                    color: "Blue"
                   )
        ],
        onAppear: { _ in
            // Do nothing for preview purposes
        }
    )
}
