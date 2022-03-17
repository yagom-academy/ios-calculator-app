//
//  OperatorTests.swift
//  CalculatorItemQueueTests
//
//  Created by 조민호 on 2022/03/17.
//

import XCTest
@testable import Calculator

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
    
    func test_Operator가add이고calculate할때_결과값이예상값과같아야한다() {
        // given
        sut = .add
        
        // when
        let result = sut.calculate(lhs: 1.0, rhs: 2.0)
        
        // then
        let expected = 3.0
        XCTAssertEqual(result, expected)
    }
    
    func test_Operator가substract이고calculate할때_결과값이예상값과같아야한다() {
        // given
        sut = .substract
        
        // when
        let result = sut.calculate(lhs: 2.0, rhs: 1.0)
        
        // then
        let expected = 1.0
        XCTAssertEqual(result, expected)
    }
    
    func test_Operator가divide이고calculate할때_결과값이예상값과같아야한다() {
        // given
        sut = .divide
        
        // when
        let result = sut.calculate(lhs: 2.0, rhs: 1.0)
        
        // then
        let expected = 2.0
        XCTAssertEqual(result, expected)
    }
    
    func test_Operator가multiply이고calculate할때_결과값이예상값과같아야한다() {
        // given
        sut = .multiply
        
        // when
        let result = sut.calculate(lhs: 2.0, rhs: 1.0)
        
        // then
        let expected = 2.0
        XCTAssertEqual(result, expected)
    }
    
    func test_Operator가divide이고rhs를0으로calculate할때_예상되는에러를반환해야한다() {
        // given
        sut = .divide
        
        // when
        let result = sut.calculate(lhs: 2.0, rhs: 0.0)
        
        // then
        let expected: CalculatorError = .dividedByZero
        XCTAssertThrowsError(try result) { error in
            XCTAssertEqual(error as? CalculatorError, expected)
        }
    }
}
