//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by 박종화 on 2023/06/13.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        sut = Formula()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_parse에_1더하기2를넣으면_Formlua가반환되어result함수를_호출하면3이나오는지() {
        // given
        let input = "1 + 2"
        var sut = ExpressionParser.parse(from: input)
        let expectation: Double = 3
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_parse에_0을나누는연산을넣으면_nan을빈환하는지() {
        //given
        let input = "3 + 5 / 0"
        var sut = ExpressionParser.parse(from: input)
        
        // when
        let result = sut.result().isNaN
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_parse에_연산되는값을넣으면_operands스택에피연산자가_올바르게들어가는지() {
        // given
        let input = "-1 * -5 - -3"
        var sut = ExpressionParser.parse(from: input)
        let expectation: Double = -1
        let expectation2: Double = -5
        let expectation3: Double = -3
        
        // when
        let result = sut.operands.dequeue()
        let result2 = sut.operands.dequeue()
        let result3 = sut.operands.dequeue()
        
        // then
        XCTAssertEqual(result, expectation)
        XCTAssertEqual(result2, expectation2)
        XCTAssertEqual(result3, expectation3)
    }
    
    func test_parse에_연산되는값을넣으면_operators스택에연산자가_올바르게들어가는지() {
        // given
        let input = "-1 * -5 - -3"
        var sut = ExpressionParser.parse(from: input)
        let expectation = Calculator.Operator.multiply
        let expectation2 = Calculator.Operator.subtract
        
        // when
        let result = sut.operators.dequeue()
        let result2 = sut.operators.dequeue()
        
        // then
        XCTAssertEqual(result, expectation)
        XCTAssertEqual(result2, expectation2)
    }
    
    func test_parse에_음수피연산자를넣으면_result의결과값이_올바르게나오는지() {
        // given
        let input = "-2 * 3 - -3"
        var sut = ExpressionParser.parse(from: input)
        let expectation: Double = -3

        // when
        let result = sut.result()
       
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_parse에_연산될값을넣었을때_operators스택에_올바르게들어가는지() {
        // given
        let input = "-2 * 3 - -3"
        var sut = ExpressionParser.parse(from: input)
        let expectation = Operator.multiply
        let expectation2 = Operator.subtract
        
        // when
        let result = sut.operators.dequeue()
        let result2 = sut.operators.dequeue()
        
        // then
        XCTAssertEqual(expectation, result)
        XCTAssertEqual(expectation2, result2)

    }
}
