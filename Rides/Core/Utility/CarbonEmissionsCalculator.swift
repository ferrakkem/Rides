//
//  CarbonEmissionsCalculator.swift
//  Rides
//
//  Created by Ferrakkem Bhuiyan on 2024-10-06.
//

struct CarbonEmissionsCalculator {
    func calculateEmissions(kilometrage: Int) -> Double {
        if kilometrage <= 5000 {
            return Double(kilometrage) * 1.0
        } else {
            return 5000.0 + Double(kilometrage - 5000) * 1.5
        }
    }
}
