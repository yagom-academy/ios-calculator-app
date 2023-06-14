//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by 박종화 on 2023/06/13.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {

    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {

    }

    func test_parser에_값을_넣으면_Formlua가_반환되어_result함수를_호출하면_결과가_나오는지() {
        // given
        let input = "1 + 2"
        var formula = ExpressionParser.parse(from: input)
        let expectation: Double = 3
        
        // when
        let result = formula.result()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_0을_나누는_연산을_parse에_넣으면_nan을_빈환하는지() {
        //given
        let input = "3 + 5 / 0"
        var formula = ExpressionParser.parse(from: input)
        
        // when
        let result = formula.result().isNaN
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_피연산자가_부호에_맞게_operands_스택에_들어가는지() {
        // given
        let input = "-1 * -5 - -3"
        var formula = ExpressionParser.parse(from: input)
        let expectation: Double = -1
        let expectation2: Double = -5
        let expectation3: Double = -3
        
        // when
        let result = formula.operands.dequeue()
        let result2 = formula.operands.dequeue()
        let result3 = formula.operands.dequeue()
        
        // then
        XCTAssertEqual(result, expectation)
        XCTAssertEqual(result2, expectation2)
        XCTAssertEqual(result3, expectation3)
    }
    
    func test_연산자가_operators_스택에_올바르게_들어가는지() {
        // given
        let input = "-1 * -5 - -3"
        var formula = ExpressionParser.parse(from: input)
        let expectation = Calculator.Operator.multiply
        let expectation2 = Calculator.Operator.subtract
        
        // when
        let result = formula.operators.dequeue()
        let result2 = formula.operators.dequeue()
        
        // then
        XCTAssertEqual(result, expectation)
        XCTAssertEqual(result2, expectation2)
    }
    
    func test_부호가_서로다른_피연산자끼리의_연산을_parse에_넣으면_올바른_결과가_나오는지() {
        // given
        let input = "-2 * 3 - -3"
        var formula = ExpressionParser.parse(from: input)
        let expectation: Double = -3

        // when
        let result = formula.result()
       
        // then
        XCTAssertEqual(result, expectation)
    }
}
