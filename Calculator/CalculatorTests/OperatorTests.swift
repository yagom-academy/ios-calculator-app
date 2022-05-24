//
//  OperatorTests.swift
//  CalculatorTests
//
//  Created by 유한석 on 2022/05/18.
//

import XCTest

class OperatorTests: XCTestCase {
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
//MARK: - Operator.calculate
    func test_calculate메서드_덧셈테스트_15더하기9는_24() throws {
        //given
        let testLhs = 15.0
        let testRhs = 9.0
        let add = Operator.add
        
        //when
        let result = try add.calculate(lhs: testLhs, rhs: testRhs)
        
        //then
        XCTAssertEqual(result, 24)
    }
    
    func test_calculate메서드_뺄셈테스트() throws {
        //given
        let testLhs = 15.0
        let testRhs = 9.0
        let add = Operator.substract
        
        //when
        let result = try add.calculate(lhs: testLhs, rhs: testRhs)
        
        //then
        XCTAssertEqual(result, 6)
    }
    func test_calculate메서드_나눗셈테스트() throws {
        //given
        let testLhs = 15.0
        let testRhs = 3.0
        let add = Operator.divide
        
        //when
        let result = try add.calculate(lhs: testLhs, rhs: testRhs)
        
        //then
        XCTAssertEqual(result, 5.0)
    }
    func test_calculate메서드_곱셈테스트() throws{
        //given
        let testLhs = 15.0
        let testRhs = 9.0
        let add = Operator.multiply
        
        //when
        let result = try add.calculate(lhs: testLhs, rhs: testRhs)
        
        //then
        XCTAssertEqual(result, 135)
    }
}
