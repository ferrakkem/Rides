//
//  VehicleDetailView.swift
//  Rides
//
//  Created by Ferrakkem Bhuiyan on 2024-10-04.
//

import SwiftUI

struct VehicleDetailView: View {
    let vehicle: Vehicle

    var body: some View {
        VStack {
            Spacer() // Pushes the content to the vertical center
            VStack(alignment: .leading, spacing: 16) {
                // Reuse MakeModelView for displaying Make, Model, and VIN
                MakeModelView(make: vehicle.make, model: vehicle.model, vin: vehicle.vin)
                LabeledIconView(
                    iconName: "paintpalette",
                    labelText: "Color: \(vehicle.color)",
                    labelColor: .primary,
                    iconColor: .blue,
                    font: .headline
                )
                LabeledIconView(
                    iconName: "car.fill",
                    labelText: "Car Type: \(vehicle.car_type)",
                    labelColor: .primary,
                    iconColor: .green,
                    font: .headline
                )
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .shadow(radius: 5)
            .padding()
            Spacer()
        }
        .navigationTitle("Details")
    }
}

#Preview {
    VehicleDetailView(
        vehicle: Vehicle(
            make_and_model: "Honda Civic",
            vin: "23FFH64GDJDHYE",
            car_type: "Sedan",
            color: "Dark Gray",
            kilometrage: 1231
        )
    )
}
