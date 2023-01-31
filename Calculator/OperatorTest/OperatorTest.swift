//
//  OperatorTest.swift
//  OperatorTest
//
//  Created by 강민수 on 2023/01/31.
//

import XCTest
@testable import Calculator

final class OperatorTest: XCTestCase {

    var sut: Operator!

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_Operator가_add케이스의_경우_calculate의_인자가_1과_2일때_값은_3이다() {
        // given
        sut = Operator.add
        let exception: Double = 3
        
        // when
        let result = sut.calculate(lhs: 1, rhs: 2)
        
        // then
        XCTAssertEqual(result, exception)
    }
    
    func test_Operator가_subtract케이스의_경우_calculate의_인자가_2와_1일때_값은_1이다() {
        // given
        sut = Operator.subtract
        let exception: Double = 1
        
        // when
        let result = sut.calculate(lhs: 2, rhs: 1)
        
        // then
        XCTAssertEqual(result, exception)
    }
    
    func test_Operator가_multiply케이스의_경우_calculate의_인자가_2와_1일때_값은_2이다() {
        // given
        sut = Operator.multiply
        let exception: Double = 2
        
        // when
        let result = sut.calculate(lhs: 2, rhs: 1)
        
        // then
        XCTAssertEqual(result, exception)
    }
    
    func test_Operator가_divide케이스의_경우_calculate의_인자가_4와_2일때_값은_2이다() {
        // given
        sut = Operator.divide
        let exception: Double = 2
        
        // when
        let result = sut.calculate(lhs: 4, rhs: 2)
        
        // then
        XCTAssertEqual(result, exception)
    }
    
    func test_Operator가_divide케이스의_경우_calculate의_rhs인자가_0이면_값은_nan이다() {
        // given
        sut = Operator.divide
        
        // when
        let calculatedValue = sut.calculate(lhs: 4, rhs: 0)
        let result = calculatedValue.isNaN
        
        // then
        XCTAssertTrue(result)
    }

}
