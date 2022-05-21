//
//  OperatorTests.swift
//  MyCalculatorTests
//
//  Created by 이예은 on 2022/05/19.
//

import XCTest
@testable import Calculator

class OperatorTests: XCTestCase {
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
  
    func test_Operator에_1과2를넣어서_더하기연산을하면_3이나온다() throws {
        let leftValue = 1.0
        let rightValue = 2.0
        
        let result = try Operator.add.calculate(lhs: leftValue, rhs: rightValue)
        
        XCTAssertEqual(result, 3.0)
    }
    
    func test_Operator에_3과4를넣어서_곱하기연산을하면_12이나온다() throws {
        let leftValue = 3.0
        let rightValue = 4.0
        
        let result = try Operator.multiply.calculate(lhs: leftValue, rhs: rightValue)
        
        XCTAssertEqual(result, 12.0)
    }
    
    func test_Operator에_3을0으로_나누기연산을하면_오류를던진다() throws {
        let leftValue = 3.0
        let rightValue = 0.0
        
        XCTAssertThrowsError(try Operator.divide.calculate(lhs: leftValue, rhs: rightValue))
    }
}
