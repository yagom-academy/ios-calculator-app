//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by 혜모리 on 2023/01/28.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_parse호출시_operandsExpectation요소와_operands의value가모두같다() {
        // given
        let calculatorValue = "1 + 2 * 4 / 3 + -7 + 8"
        let operandsExpectation: [Double] = [1, 2, 4, 3, -7, 8]
        let operandsCount = operandsExpectation.count
        
        // when
        sut = ExpressionParser.parse(from: calculatorValue)
        
        // then
        for count in 0..<operandsCount {
            XCTAssertEqual(operandsExpectation[count], sut.operands.dequeue()?.value)
        }
    }
    
    func test_parse호출시_operatorsExpectation요소와_operators의value가모두같다() {
        // given
        let calculatorValue = "1 + 2 * 4 / 3 + -7 + 8"
        let operatorsExpectation: [Operator] = [.add, .multiply, .divide, .add, .add]
        let operatorsCount = operatorsExpectation.count
        
        // when
        sut = ExpressionParser.parse(from: calculatorValue)
        
        // then
        for count in 0..<operatorsCount {
            XCTAssertEqual(operatorsExpectation[count], sut.operators.dequeue()?.value)
        }
    }
}
