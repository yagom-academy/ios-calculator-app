//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by H on 2/19/24.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    
    var formulaSlut: Formula?

    override func setUpWithError() throws {
        try super.setUpWithError()
        formulaSlut = Formula()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        formulaSlut = nil
    }

    func test_1더하기1() throws {
        // given
        formulaSlut?.operands.push(1)
        formulaSlut?.operands.push(1)
        formulaSlut?.operators.push("+")
        
        // when
        let result = try formulaSlut?.result()
        let expection: Double = 2
        
        // then
        XCTAssertEqual(result, expection)
    }
    
    func test_1빼기1() throws {
        // given
        formulaSlut?.operands.push(1)
        formulaSlut?.operands.push(1)
        formulaSlut?.operators.push("-")
        
        // when
        let result = try formulaSlut?.result()
        let expection: Double = 0
        
        // then
        XCTAssertEqual(result, expection)
    }
    
    func test_1곱하기1() throws {
        // given
        formulaSlut?.operands.push(1)
        formulaSlut?.operands.push(1)
        formulaSlut?.operators.push("*")
        
        // when
        let result = try formulaSlut?.result()
        let expection: Double = 1
        
        // then
        XCTAssertEqual(result, expection)
    }
    
    func test_1나누기1() throws {
        // given
        formulaSlut?.operands.push(1)
        formulaSlut?.operands.push(1)
        formulaSlut?.operators.push("%")
        
        // when
        let result = try formulaSlut?.result()
        let expection: Double = 1
        
        // then
        XCTAssertEqual(result, expection)
    }
    
    func test_0을나눌때() throws {
        // given
        formulaSlut?.operands.push(10)
        formulaSlut?.operands.push(0)
        formulaSlut?.operators.push("%")
        
        // then
        XCTAssertThrowsError(try formulaSlut?.result()) { error in
            XCTAssertEqual(error as? CalculatorError, CalculatorError.divideByZero)
        }
    }
}
