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
        sut = MockCalculator()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testCaculatable_givenMultiplicationEquation_expect200() {
        sut.formulaStack = ["10", "𝗑", "20"]
        let result = sut.calculateResult()
        XCTAssertEqual(result, 200)
    }
}
