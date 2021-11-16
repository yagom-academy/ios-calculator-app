//
//  CaculatorManagerTests.swift
//  CalculatorTests
//
//  Created by 이승재 on 2021/11/16.
//

import XCTest

class CaculatorManagerTests: XCTestCase {
    
    private let calculatorManager = CalculatorManager(isCalculating: false)
    private var numberToConvert: String = ""

    func testConvertToDecimalStyleWhereNumberIsInt() {
        numberToConvert = "1234"
        XCTAssertEqual(calculatorManager.format(of: numberToConvert), "1,234")
    }
    
    func testConvertToDecimalStyleWhereNumberIsNegativeInt() {
        numberToConvert = "-1234"
        XCTAssertEqual(calculatorManager.format(of: numberToConvert), "-1,234")
    }
    
    func testConvertToDecimalStyleWhereNumberIsDouble() {
        numberToConvert = "1234.01234"
        XCTAssertEqual(calculatorManager.format(of: numberToConvert), "1,234.01234")
    }
    
    func testConvertToDecimalStyleWhereNumberIsNegativeDouble() {
        numberToConvert = "-1234.01234"
        XCTAssertEqual(calculatorManager.format(of: numberToConvert), "-1,234.01234")
    }
    
    func testConvertToDecimalStyleWhereNumberIsZero() {
        numberToConvert = "0.0"
        XCTAssertEqual(calculatorManager.format(of: numberToConvert), "0")
    }
}
