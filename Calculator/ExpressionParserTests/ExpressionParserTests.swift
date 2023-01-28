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

    func test_parse호출시_연산자와피연산자를나눠_Formula로반환한다() {
        // given
        let calculatorValue = "1 + 2 * 4 / 3 + -7 + 8"
        let operatorsExpectation: [Operator] = [.add, .multiply, .divide, .add, .add]
        let operandsExpectation: [Double] = [1, 2, 4, 3, -7, 8]
        
        // when
        sut = ExpressionParser.parse(from: calculatorValue)
        
        // then
        XCTAssertEqual(operatorsExpectation[0], sut.operators.dequeue()?.value)
        XCTAssertEqual(operandsExpectation[0], sut.operands.dequeue()?.value)
    }
}
