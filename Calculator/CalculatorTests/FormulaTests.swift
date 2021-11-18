//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by 김진태 on 2021/11/17.
//

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func testThreeAddSix() throws {
        sut.operands.insert(3)
        sut.operators.insert(.add)
        sut.operands.insert(6)
        
        let calculatedResult = try sut.result()
        let expectedResult: Double = 9
        
        XCTAssertEqual(calculatedResult, expectedResult)
    }
    
    func testThreeMultiplyMinusSix() throws {
        sut.operands.insert(3)
        sut.operators.insert(.multiply)
        sut.operands.insert(-6)
        
        let calculatedResult = try sut.result()
        let expectedResult: Double = -18
        
        XCTAssertEqual(calculatedResult, expectedResult)
    }
    
    func testSixSubtractNineMultiplyEight() throws {
        sut.operands.insert(6)
        sut.operators.insert(.subtract)
        sut.operands.insert(9)
        sut.operators.insert(.multiply)
        sut.operands.insert(8)
        
        let calculatedResult = try sut.result()
        let expectedResult: Double = -24
        
        XCTAssertEqual(calculatedResult, expectedResult)
    }
    
    func testSixSubtractNineMultiplyMinusEightDivideThree() throws {
        sut.operands.insert(6)
        sut.operators.insert(.subtract)
        sut.operands.insert(9)
        sut.operators.insert(.multiply)
        sut.operands.insert(-8)
        sut.operators.insert(.divide)
        sut.operands.insert(3)
        
        let calculatedResult = try sut.result()
        let expectedResult: Double = 8
        
        XCTAssertEqual(calculatedResult, expectedResult)
    }
    
    func testDivideUsingZero() throws {
        sut.operands.insert(6)
        sut.operators.insert(.divide)
        sut.operands.insert(0)
        
        XCTAssertThrowsError(try sut.result()) { error in
            XCTAssertEqual(error as? OperatorError, OperatorError.divisionByZero)
        }
    }
}
