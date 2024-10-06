//
//  CarbonEmissionTests.swift
//  RidesTests
//
//  Created by Ferrakkem Bhuiyan on 2024-10-06.
//

import Testing

import XCTest
@testable import Rides
class CarbonEmissionTests: XCTestCase {
    func testEmissionFor5000km() {
        XCTAssertEqual(calculateEmissions(kilometrage: 5000), 5000.0, "Emission for 5000km should be 5000")
    }
    func testEmissionFor6000km() {
        XCTAssertEqual(calculateEmissions(kilometrage: 6000), 6500.0, "Emission for 6000km should be 6500")
    }
    func calculateEmissions(kilometrage: Int) -> Double {
        if kilometrage <= 5000 {
            return Double(kilometrage) * 1.0
        } else {
            return 5000.0 + Double(kilometrage - 5000) * 1.5
        }
    }
}
