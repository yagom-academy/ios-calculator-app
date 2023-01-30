//
//  OperatorTests.swift
//  OperatorTests
//
//  Created by Harry on 2023/01/27.
//

import XCTest

final class OperatorTests: XCTestCase {
    var sut: Operator!

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_Operator의_case가_add일때_calculate메서드의_파라미터로_3과_4를_넣으면_7이반환된다() {
        sut = Operator.add
        let expectedResult: Double = 7
        
        let result = sut.calculate(lhs: 3, rhs: 4)
        
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_Operator의_case가_add일때_calculate메서드의_파라미터로_음수3과_2를_넣으면_음수1이반환된다() {
        sut = Operator.add
        let expectedResult: Double = -1
        
        let result = sut.calculate(lhs: -3, rhs: 2)
        
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_Operator의_case가_subtract일때_calculate메서드의_파라미터로_3과_4를_넣으면_음수1이_반환된다() {
        sut = Operator.subtract
        let expectedResult: Double = -1
        
        let result = sut.calculate(lhs: 3, rhs: 4)
        
        XCTAssertEqual(result, expectedResult)
    }
}
