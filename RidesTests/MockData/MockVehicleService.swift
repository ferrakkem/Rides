//
//  MockVehicleService.swift
//  RidesTests
//
//  Created by Ferrakkem Bhuiyan on 2024-10-06.
//

import XCTest
import Combine
@testable import Rides

class MockVehicleService: VehicleService {
    override func fetchVehicles(count: Int) -> AnyPublisher<[Vehicle], NetworkError> {
        // Return some mock vehicle data for testing
        let mockVehicles: [Vehicle] = [
            Vehicle(make_and_model: "Toyota Corolla", vin: "1234567890", car_type: "Sedan", color: "Red", kilometrage: 200),
            Vehicle(make_and_model: "Honda Civic", vin: "0987654321", car_type: "Coupe", color: "Blue", kilometrage: 3209)
        ]
        return Just(mockVehicles)
            .setFailureType(to: NetworkError.self)
            .eraseToAnyPublisher()
    }
}

