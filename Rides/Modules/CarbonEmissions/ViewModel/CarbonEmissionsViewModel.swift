//
//  CarbonEmissionsViewModel.swift
//  Rides
//
//  Created by Ferrakkem Bhuiyan on 2024-10-06.
//

import Foundation
import Combine

class CarbonEmissionsViewModel: ObservableObject {
    @Published var emissions: Double = 0.0
    
    private let calculator = CarbonEmissionsCalculator()
    
    func calculateEmissions(kilometrage: Int) {
        emissions = calculator.calculateEmissions(kilometrage: kilometrage)
    }
}
