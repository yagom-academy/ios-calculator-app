//
//  ExpressionParserTest.swift
//  ExpressionParserTest
//
//  Created by 김인호 on 2022/09/27.
//

import XCTest
@testable import Calculator

class ExpressionParserTest: XCTestCase {
    func test_parse실행시_input의_부호변환기호를_연산자에담지않는가() {
        //given
        let input = "3 / -3 + -6"
        
        //when
        let operators = ExpressionParser.parse(from: input).operators
        
        //then
        XCTAssertEqual(Operator.divide, operators.dequeue())
        XCTAssertEqual(Operator.add, operators.dequeue())
        XCTAssertNil(operators.dequeue())
    }

    func test_parse실행시_input의요소를_큐에담는가() {
        //given
        let input = "1 + 2 - -4 / 93 * 3.2"
        
        //when
        let components = ExpressionParser.parse(from: input)
        let operands = components.operands
        let operators = components.operators
        
        //then
        XCTAssertEqual(1, operands.dequeue())
        XCTAssertEqual(2, operands.dequeue())
        XCTAssertEqual(-4, operands.dequeue())
        XCTAssertEqual(93, operands.dequeue())
        XCTAssertEqual(3.2, operands.dequeue())
        
        XCTAssertEqual(Operator.add, operators.dequeue())
        XCTAssertEqual(Operator.subtract, operators.dequeue())
        XCTAssertEqual(Operator.divide, operators.dequeue())
        XCTAssertEqual(Operator.multiply, operators.dequeue())
    }
    
}
