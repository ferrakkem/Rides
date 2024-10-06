//
//  VehicleListViewModelTests.swift
//  RidesTests
//
//  Created by Ferrakkem Bhuiyan on 2024-10-06.
//


import XCTest
import Combine
@testable import Rides

class VehicleListViewModelTests: XCTestCase {
    var viewModel: VehicleListViewModel!
    var mockVehicleService: MockVehicleService!
    var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        mockVehicleService = MockVehicleService()
        viewModel = VehicleListViewModel(apiService: mockVehicleService)
        cancellables = Set<AnyCancellable>()
    }

    override func tearDown() {
        viewModel = nil
        mockVehicleService = nil
        cancellables = nil
        super.tearDown()
    }

    // Test case when input is valid
    func testValidateAndFetchVehicles_ValidInput() {
        // Given
        let validInput = "10"
        // When
        viewModel.validateAndFetchVehicles(searchText: validInput)
        // Then
        XCTAssertNil(viewModel.errorMessage, "Error message should be nil for valid input")
    }
    // Test case when input is out of range
    func testValidateAndFetchVehicles_OutOfRangeInput() {
        // Given
        let invalidInput = "105"  // Out of range
        // When
        viewModel.validateAndFetchVehicles(searchText: invalidInput)
        // Then
        XCTAssertEqual(viewModel.errorMessage, VehicleListViewStrings.invalidInputMessage, "Error message should indicate invalid input")
    }

    // Test case when input is not a number
    func testValidateAndFetchVehicles_NonNumericInput() {
        // Given
        let invalidInput = "abc"  // Non-numeric input
        // When
        viewModel.validateAndFetchVehicles(searchText: invalidInput)
        // Then
        XCTAssertEqual(viewModel.errorMessage, VehicleListViewStrings.invalidInputMessage, "Error message should indicate invalid input")
    }

    // Test case when input is empty
    func testValidateAndFetchVehicles_EmptyInput() {
        // Given
        let emptyInput = ""  // Empty input
        // When
        viewModel.validateAndFetchVehicles(searchText: emptyInput)
        // Then
        XCTAssertEqual(viewModel.errorMessage, VehicleListViewStrings.invalidInputMessage, "Error message should indicate invalid input")
    }
}
