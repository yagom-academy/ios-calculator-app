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

    func testCalculatable_givenMultiplicationEquation_expect200() {
        sut.formulaStack = ["10", "𝗑", "20"]
        let result = sut.calculateResult()
        XCTAssertEqual(result, 200)
    }
    
    func testCalculatable_givenInvalidEquation_expectNaN() {
        sut.formulaStack = ["10", "÷", "0"]
        let result = sut.calculateResult()
        XCTAssertTrue(result.isNaN)
    }
    
    func testCalculatable_givenMixedEquation_expect4Point2() {
        sut.formulaStack = ["10", "𝗑", "20", "−", "30", "+", "40", "÷", "50"]
        let result = sut.calculateResult()
        XCTAssertEqual(result, 4.2)
    }
    
    func testCalculatable_givenMixedEquation_expect1Point4() {
        sut.formulaStack = ["1.5", "−", "0.5", "𝗑", "10", "+", "4", "÷", "10"]
        let result = sut.calculateResult()
        XCTAssertEqual(result, 1.4)
    }
}
