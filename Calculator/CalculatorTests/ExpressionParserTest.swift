//
//  ExpressionParserTest.swift
//  CalculatorTests
//
//  Created by Seul Mac on 2021/11/12.
//

import XCTest

class ExpressionParserTest: XCTestCase {

    func test_정수_4개_add연산자_3개_dequeue_1번() {
        let testStr = "2+3+12+466"
        var result = ExpressionParser.parse(from: testStr)
        let dequeueResult = result.operands.dequeue()
        
        XCTAssertEqual(dequeueResult, 2)
    }
    
    func test_음수_실수_각2개_add연산자_3개_dequeue_1번() {
        let testStr = "2.22+-3.33+1.2+-466"
        var result = ExpressionParser.parse(from: testStr)
        let dequeueResult = result.operands.dequeue()
        
        XCTAssertEqual(dequeueResult, 2.22)
    }
    
    func test_음수_실수_각2개_add연산자_3개_dequeue_2번() {
        let testStr = "2.22+-3.33+1.2+-466"
        var result = ExpressionParser.parse(from: testStr)
        let _ = result.operands.dequeue()
        let dequeueResult = result.operands.dequeue()
        
        XCTAssertEqual(dequeueResult, -3.33)
    }
    
    func test_복합수식_operands_dequeue_3번() {
        let testStr = "11+1.2−13×14.990÷15+16−-17×1.8÷19.999"
        var result = ExpressionParser.parse(from: testStr)
        let _ = result.operands.dequeue()
        let _ = result.operands.dequeue()
        let dequeueResult = result.operands.dequeue()

        XCTAssertEqual(dequeueResult, 13)
    }
    
    func test_복합수식_operators_dequeue_1번() {
        let testStr = "11+1.2−13×14.990÷15+16−-17×1.8÷19.999"
        var result = ExpressionParser.parse(from: testStr)
        let dequeueResult = result.operators.dequeue()
        
        XCTAssertEqual(dequeueResult, Operator.add)
    }

}
