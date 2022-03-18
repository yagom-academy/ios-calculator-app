//
//  OperatorTests.swift
//  CalculatorTests
//
//  Created by 이시원 on 2022/03/18.
//

import XCTest
@testable import Calculator

class OperatorTests: XCTestCase {
    var sut: Operator!

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_1점1_add_1점2_return_Equal_1점1_더하기_1점2() {
        // given
        sut = .add
        let first = 1.1
        let second = 1.2

        // when
        let result = sut.calculate(lhs: first, rhs: second)
        // then
        XCTAssertEqual(result, first + second)
    }
    
    func test_1점1_subtract_1점2_return_Equal_1점1_빼기_1점2() {
        // given
        sut = .subtract
        let first = 1.1
        let second = 1.2

        // when
        let result = sut.calculate(lhs: first, rhs: second)
        // then
        XCTAssertEqual(result, first - second)
    }
    
    func test_1점1_divide_1점2_return_Equal_1점1_나누기_1점2() {
        // given
        sut = .divide
        let first = 1.1
        let second = 1.2

        // when
        let result = sut.calculate(lhs: first, rhs: second)
        // then
        XCTAssertEqual(result, first / second)
    }
    
    func test_1점1_multiply_1점2_return_Equal_1점1_곱하기_1점2() {
        // given
        sut = .multiply
        let first = 1.1
        let second = 1.2

        // when
        let result = sut.calculate(lhs: first, rhs: second)
        // then
        XCTAssertEqual(result, first * second)
    }
    
    

}
