//
//  OperatorTests.swift
//  OperatorTests
//
//  Created by kokkilE on 2023/01/27.
//

import XCTest
@testable import Calculator

final class OperatorTests: XCTestCase {
    var sut: Operator!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        

    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }

    func test_add_Case의_calculate_호출시_덧셈결과가_반환된다() throws {
        // given
        sut = Operator(rawValue: Operator.add.rawValue)
        let input1 = 1.0
        let input2 = 2.0
        let expectation = input1 + input2
        
        // when
        let result = try sut.calculate(lhs: input1, rhs: input2)
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_subtract_Case의_calculate_호출시_뺄셈결과가_반환된다() throws {
        // given
        sut = Operator(rawValue: Operator.subtract.rawValue)
        let input1 = 1.0
        let input2 = 2.0
        let expectation = input1 - input2
        
        // when
        let result = try sut.calculate(lhs: input1, rhs: input2)
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_divide_Case의_calculate_호출시_나눗셈결과가_반환된다() throws {
        // given
        sut = Operator(rawValue: Operator.divide.rawValue)
        let input1 = 1.0
        let input2 = 2.0
        let expectation = input1 / input2
        
        // when
        let result = try sut.calculate(lhs: input1, rhs: input2)
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_divide_Case의_calculate_호출시_0나누기가_실행될경우_에러를_throw한다() throws {
        // given
        sut = Operator(rawValue: Operator.divide.rawValue)
        let input1 = 1.0
        let input2 = 0.0
        
        // then
        XCTAssertThrowsError(try sut.calculate(lhs: input1, rhs: input2))
    }
    
    func test_multiply_Case의_calculate_호출시_곱셈결과가_반환된다() throws {
        // given
        sut = Operator(rawValue: Operator.multiply.rawValue)
        let input1 = 1.0
        let input2 = 2.0
        let expectation = input1 * input2
        
        // when
        let result = try sut.calculate(lhs: input1, rhs: input2)
        
        // then
        XCTAssertEqual(result, expectation)
    }

}
