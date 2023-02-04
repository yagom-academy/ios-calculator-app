//
//  CalculatorTests - FormulaTests.swift
//  Created by Rhode.
//  Copyright © yagom. All rights reserved.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var sut: Formula!

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_operands에1과2가들어있고operators에더하기가있을경우_result호출시_3을반환한다() {
        //given
        sut = .init(operands: .init([1.0, 2.0]), operators: .init([Operator.add]))
        let expectedValue = 3.0
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertEqual(expectedValue, result)
    }
    
    func test_operands에1과2와4이들어있고operators에더하기와빼기가있을경우_result호출시_음수1을반환한다() {
        //given
        sut = .init(operands: .init([1.0, 2.0, 4.0]), operators: .init([Operator.add, Operator.subtract]))
        let expectedValue = -1.0
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertEqual(expectedValue, result)
    }
    
    func test_operands에3과0과2가들어있고operators에나누기와더하기가있을경우_result호출시_NaN을반환한다() {
        //given
        sut = .init(operands: .init([3.0, 0.0, 2.0]), operators: .init([Operator.divide, Operator.add]))
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertTrue(result.isNaN)
    }
    
    func test_operands가빈큐일경우_result호출시_0을반환한다() {
        //given
        sut = .init(operands: .init(), operators: .init())
        let expectedValue = Double.zero
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertEqual(expectedValue, result)
    }
    
    func test_operands에3이들어있을경우_result호출시_3을반환한다() {
        //given
        sut = .init(operands: .init([3.0]), operators: .init())
        let expectedValue = 3.0
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertEqual(expectedValue, result)
    }
    
    func test_operands에3이들어있고operators에더하기가있을경우_result호출시_3을반환한다() {
        //given
        sut = .init(operands: .init([3.0]), operators: .init([Operator.add]))
        let expectedValue = 3.0
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertEqual(expectedValue, result)
    }
}
