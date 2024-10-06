//
//  ErrorManager.swift
//  Rides
//
//  Created by Ferrakkem Bhuiyan on 2024-10-04.
//

import Foundation
class ErrorManager {
    static func handleError(_ error: NetworkError) -> String {
        switch error {
        case .invalidURL:
            return "Invalid URL."
        case .dataError:
            return "Data error occurred."
        case .decodingError:
            return "Failed to decode data."
        case .invalidResponse:
            return "Invalid response."
        case .customError(let code, let message):
            return "Error \(code): \(message)"
        default:
            return "Unknown error."
        }
    }
}
