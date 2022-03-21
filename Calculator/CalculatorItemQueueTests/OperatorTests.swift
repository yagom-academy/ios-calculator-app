//
//  OperatorTests.swift
//  CalculatorItemQueueTests
//
//  Created by 조민호 on 2022/03/17.
//

import XCTest

class OperatorTests: XCTestCase {
    var sut: Operator!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = .add
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_add_calculate() {
        // given
        sut = .add
        let lhs = 2.0
        let rhs = 1.0
        
        // when
        let result = try? sut.calculate(lhs: lhs, rhs: rhs)
        
        // then
        XCTAssertEqual(result, lhs + rhs)
    }
    
    func test_substract_calculate() {
        // given
        sut = .substract
        let lhs = 2.0
        let rhs = 1.0
        
        // when
        let result = try? sut.calculate(lhs: lhs, rhs: rhs)
        
        // then
        XCTAssertEqual(result, lhs - rhs)
    }
    
    func test_divide_calculate() {
        // given
        sut = .divide
        let lhs = 2.0
        let rhs = 1.0
        
        // when
        let result = try? sut.calculate(lhs: lhs, rhs: rhs)
        
        // then
        XCTAssertEqual(result, lhs / rhs)
    }
    
    func test_multiply_calculate() {
        // given
        sut = .multiply
        let lhs = 2.0
        let rhs = 1.0
        
        // when
        let result = try? sut.calculate(lhs: lhs, rhs: rhs)
        
        // then
        XCTAssertEqual(result, lhs * rhs)
    }
    
    func test_Operator가divide이고rhs를0으로calculate를호출할때_예상되는에러를반환해야한다() {
        // given
        sut = .divide
        
        // when
        // then
        let expected: CalculatorError = .dividedByZero
        XCTAssertThrowsError(try sut.calculate(lhs: 2.0, rhs: 0.0)) { error in
            XCTAssertEqual(error as? CalculatorError, expected)
        }
    }
}
