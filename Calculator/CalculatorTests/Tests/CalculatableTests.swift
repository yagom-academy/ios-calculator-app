//
//  CalculatableTests.swift
//  CalculatorTests
//
//  Created by Jun Bang on 2021/11/25.
//

import XCTest
@testable import Calculator

class CalculatableTests: XCTestCase {
    var sut: Calculatable!
    override func setUpWithError() throws {
        sut = MockCalculatorManager()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testCaculatable_givenMultiplicationEquation_expect200() {
        let dummyHistoryStack = ["", "010", "𝗑", "020"]
        let result = sut.calculateResult(from: dummyHistoryStack)
        XCTAssertEqual(result, 200)
    }
}
