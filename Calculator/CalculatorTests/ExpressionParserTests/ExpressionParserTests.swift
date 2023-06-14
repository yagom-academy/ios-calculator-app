//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by karen, Mary.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    func test_1더하기2를인수로넣고_parse호출시_결과의숫자큐에는1과2가연산큐에는더하기가들어간다() {
        // given
        let input = "1+2"
        
        // when
        var result = ExpressionParser.parse(from: input)

        // then
        XCTAssertEqual(result.operands.dequeue(), 1.0)
        XCTAssertEqual(result.operands.dequeue(), 2.0)
        XCTAssertEqual(result.operators.dequeue(), .add)
    }
    
    func test_1더하기2빼기3을인수로넣고_parse호출시_결과의숫자큐에는1과2와3이연산큐에는더하기빼기가들어간다() {
        // given
        let input = "1+2−3"
        
        // when
        var result = ExpressionParser.parse(from: input)

        // then
        XCTAssertEqual(result.operands.dequeue(), 1.0)
        XCTAssertEqual(result.operands.dequeue(), 2.0)
        XCTAssertEqual(result.operands.dequeue(), 3.0)
        XCTAssertEqual(result.operators.dequeue(), .add)
        XCTAssertEqual(result.operators.dequeue(), .subtract)
    }
    
    func test_1더하기5빼기음수3을인수로넣고_parse호출시_결과의숫자큐에는1과5와음수3이연산큐에는더하기와빼기가들어간다() {
        // given
        let input = "1+5−-3"
        
        // when
        var result = ExpressionParser.parse(from: input)

        // then
        XCTAssertEqual(result.operands.dequeue(), 1.0)
        XCTAssertEqual(result.operands.dequeue(), 5.0)
        XCTAssertEqual(result.operands.dequeue(), -3.0)
        XCTAssertEqual(result.operators.dequeue(), .add)
        XCTAssertEqual(result.operators.dequeue(), .subtract)
    }
    
    func test_3곱하기음수2나누기음수3을인수로넣고_parse호출시_결과의숫자큐에는3과음수2와음수3이연산큐에는곱하기와나누기가들어간다() {
        // given
        let input = "3×-2÷-3"
        
        // when
        var result = ExpressionParser.parse(from: input)

        // then
        XCTAssertEqual(result.operands.dequeue(), 3.0)
        XCTAssertEqual(result.operands.dequeue(), -2.0)
        XCTAssertEqual(result.operands.dequeue(), -3.0)
        XCTAssertEqual(result.operators.dequeue(), .multiply)
        XCTAssertEqual(result.operators.dequeue(), .divide)
    }
    
    func test_3을인수로넣고_parse호출시_결과의숫자큐에는3이들어가고연산큐는비어있다() {
        // given
        let input = "3"
        
        // when
        var result = ExpressionParser.parse(from: input)

        // then
        XCTAssertEqual(result.operands.dequeue(), 3.0)
        XCTAssertEqual(result.operators.dequeue(), nil)
    }
}
