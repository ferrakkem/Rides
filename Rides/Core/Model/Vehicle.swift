//
//  Vehicle.swift
//  Rides
//
//  Created by Ferrakkem Bhuiyan on 2024-10-04.
//

import Foundation
struct Vehicle: Identifiable, Codable, Equatable {
    var id: String { vin }
    let make_and_model: String
    let vin: String
    let car_type: String
    let color: String
    let kilometrage: Int
    var make: String {
        // Assume make is the first part before a space
        return make_and_model.split(separator: " ").first.map(String.init) ?? "Unknown"
    }
    var model: String {
        // Assume model is the rest after the first space
        return make_and_model.split(separator: " ").dropFirst().joined(separator: " ")
    }
}
