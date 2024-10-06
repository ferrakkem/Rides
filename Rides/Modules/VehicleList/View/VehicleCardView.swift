//
//  VehicleCardView.swift
//  Rides
//
//  Created by Ferrakkem Bhuiyan on 2024-10-04.
//

import SwiftUI
struct VehicleCardView: View {
    let vehicle: Vehicle
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            MakeModelView(make: vehicle.make, model: vehicle.model, vin: vehicle.vin)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .shadow(radius: 2)
        .padding(.horizontal)
    }
}
#Preview {
    VehicleCardView(
        vehicle: Vehicle(
            make_and_model: "Audi V8",
            vin: "234SDFSD56R",
            car_type: "Sedan",
            color:"Olive",
            kilometrage: 23423
        )
    )
}
