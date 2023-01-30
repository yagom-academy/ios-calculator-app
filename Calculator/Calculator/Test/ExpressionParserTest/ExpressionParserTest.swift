//
//  ExpressionParserTest.swift
//  ExpressionParserTest
//
//  Created by 김성준 on 2023/01/27.
//

import XCTest


@testable import Calculator

final class ExpressionParserTest: XCTestCase {

    
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {

    }
    

    func test_정상적인값이_주어졌을때_Parse를_실행하면_피연산자는_Formula_인스턴스의_operands큐에_요소가_추가된다() {
        //give
        let string = "30 + 25 - 29"

        //when
        var operands = ExpressionParser.parse(from: string).operands
        var resultOperands: [Double] = []
        
        while operands.count > 0 {
            guard let element = operands.dequeue() else { return }
            resultOperands.append(element)
        }
        
        //then
        let result = resultOperands
        let expectation = [30.0, 25.0, 29.0]

        XCTAssertEqual(result, expectation)
    }
    
    func test_정상적인값이_주어졌을때_Parse를_실행하면_연산자는_Formula_인스턴스의_opperator큐에_요소가_추가된다() {
        //give
        let string = "30 + 25 - 29"
        
        //when
        var operators = ExpressionParser.parse(from: string).operators
        var resultOperators: [Operator] = []
        
        while operators.count > 0 {
            guard let element = operators.dequeue() else { return }
            resultOperators.append(element)
        }
        
        //then
        let result = resultOperators
        let expectation: [Operator] = [.add, .subtract]
        
        XCTAssertEqual(result, expectation)
    }
}
