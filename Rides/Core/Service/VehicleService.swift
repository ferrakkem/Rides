//
//  VehicleService.swift
//  Rides
//
//  Created by Ferrakkem Bhuiyan on 2024-10-04.
//

import Foundation
import Combine

class VehicleService {
    static let shared = VehicleService()
    // Use the vehicle endpoint from APIConstants
    private let vehicleAPIURL = APIConstants.Endpoints.vehicle
    // Function to fetch a single vehicle
    func fetchVehicles() -> AnyPublisher<Vehicle, NetworkError> {
        guard let url = URL(string: vehicleAPIURL) else {
            return Fail(error: NetworkError.invalidURL)
                .eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) -> Data in
                return data
            }
            .decode(type: Vehicle.self, decoder: JSONDecoder())
            .mapError { error in
                if error is DecodingError {
                    return .decodingError
                } else {
                    return .unknownError
                }
            }
            .eraseToAnyPublisher()
    }
}
