//
//  NetworkError.swift
//  Rides
//
//  Created by Ferrakkem Bhuiyan on 2024-10-04.
//

import Foundation
enum NetworkError: LocalizedError {
    case invalidResponse
    case invalidURL
    case dataError
    case unknownError
    case decodingError
    case retryLater
    case customError(code: Int, message: String)
    var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return "Invalid response from the server."
        case .invalidURL:
            return "The URL is invalid."
        case .dataError:
            return "Failed to retrieve data."
        case .unknownError:
            return "An unknown error occurred."
        case .decodingError:
            return "No data available at the moment."
        case .retryLater:
                    return "Please try again later."
        case .customError(let code, let message):
            return "Error \(code): \(message)"
        }
    }
}
