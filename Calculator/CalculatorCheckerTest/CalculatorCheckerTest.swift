//
//  CalculatorCheckerTest.swift
//  CalculatorCheckerTest
//
//  Created by 천승현 on 2023/02/07.
//

import XCTest
@testable import Calculator

final class CalculatorCheckerTest: XCTestCase {

    private var sut: CalculatorChecker!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorChecker(updateClosure: { _ in })
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    private func test_appendingNumber호출시_값이존재하지않을때_1을넣는다면_enteringNumber가_1이다() {
        // given
        let input = "1"
        let expectation = "1"
        
        // when
        sut.appendingNumber(input)
        let result = sut.enteringNumber
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    private func test_appendingNumber호출시_값이존재할때_1을넣는다면_enteringNumber에_1이추가된다() {
        // given
        let input = "1"
        let expectation = "21"
        
        // when
        sut.appendingNumber("2")
        sut.appendingNumber(input)
        let result = sut.enteringNumber
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    private func test_appendingExpression호출시_enteringNumber가_3이고_빈값을_넣는다면_calculationExpression은_3이다() {
        // given
        let input = ""
        let expectation = "3"
        
        // when
        sut.appendingNumber("3")
        sut.appendingExpression(input)
        let result = sut.calculationExpression
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    private func test_appendingExpression호출시_enteringNumber와_calculationExpression이_존재한다면_calculationExpression에_인자값과_enteringNumber가_추가된다() {
        // given
        let input = "+"
        let expectation = "1+2"
        
        // when
        sut.appendingNumber("1")
        sut.appendingExpression("")
        sut.appendingNumber("2")
        sut.appendingExpression(input)
        let result = sut.calculationExpression
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    private func test_appendingExpression호출시_enteringNumber는_빈값이다() {
        // given
        let input = ""
        let expectation = ""
        
        // when
        sut.appendingExpression(input)
        let result = sut.enteringNumber
        
        // then
        XCTAssertEqual(result, expectation)
    }
}
