//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by MARY on 2023/06/03.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    func test_1더하기2를인수로넣고_parse호출시_결과의숫자큐에는1과2가연산큐에는더하기가들어간다() {
        // given
        let input = "1+2"
        
        // when
        let result = try! ExpressionParser.parse(from: input)

        // then
        XCTAssertEqual(result.operands.takeQueueAsList(), [1.0, 2.0])
        XCTAssertEqual(result.operators.takeQueueAsList(), [.add])
    }
    
    func test_1더하기2빼기3을인수로넣고_parse호출시_결과의숫자큐에는1과2와3이연산큐에는더하기빼기가들어간다() {
        // given
        let input = "1+2-3"
        
        // when
        let result = try! ExpressionParser.parse(from: input)

        // then
        XCTAssertEqual(result.operands.takeQueueAsList(), [1.0, 2.0, 3.0])
        XCTAssertEqual(result.operators.takeQueueAsList(), [.add, .subtract])
    }
    
    func test_3을인수로넣고_parse호출시_결과의숫자큐에는3이들어가고연산큐는비어있다() {
        // given
        let input = "3"
        
        // when
        let result = try! ExpressionParser.parse(from: input)

        // then
        XCTAssertEqual(result.operands.takeQueueAsList(), [3.0])
        XCTAssertEqual(result.operators.takeQueueAsList(), [])
    }
    
    func test_2더하기a를인수로넣고_parse호출시_invalidOperands오류를반환한다() {
        // given
        let input = "2+a"
        
        // when, then
        XCTAssertThrowsError(try ExpressionParser.parse(from: input)) { error in
            XCTAssertEqual(error as? ExpressionParserErrors,
                           ExpressionParserErrors.invalidOperands)
        }
    }
    
    func test_2는3을인수로넣고_parse호출시_invalidOperators오류를반환한다() {
        // given
        let input = "2=3"
        
        // when, then
        XCTAssertThrowsError(try ExpressionParser.parse(from: input)) { error in
            XCTAssertEqual(error as? ExpressionParserErrors,
                           ExpressionParserErrors.invalidOperands)
        }
    }
}
