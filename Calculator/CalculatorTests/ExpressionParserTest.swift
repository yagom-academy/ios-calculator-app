//
//  ExpressionParserTest.swift
//  CalculatorTests
//
//  Created by Seul Mac on 2021/11/12.
//

import XCTest

class ExpressionParserTest: XCTestCase {

    func test_정수_4개_add연산자_3개_숫자분리() {
        let testAry = "2+3+12+466"
        var result2 = ExpressionParser.parse(from: testAry)
        let result1 = result2.operands.dequeue()
        
        XCTAssertEqual(result1, 2)
    }
    
//    func test_정수_4개_subtract연산자_3개_숫자분리() {
//        let testAry = "2−3−12−466"
//        let result = ExpressionParser.parse(from: testAry).operands.inbox
//        XCTAssertEqual(result, [2, 3, 12, 466])
//    }
//
//    func test_정수_4개_divide연산자_3개인_숫자분리() {
//        let testAry = "2÷3÷12÷466"
//        let result = ExpressionParser.parse(from: testAry).operands.inbox
//        XCTAssertEqual(result, [2, 3, 12, 466])
//    }
//    
//    func test_정수_4개_multiply연산자_3개_숫자분리() {
//        let testAry = "2×3×12×466"
//        let result = ExpressionParser.parse(from: testAry).operands.inbox
//        XCTAssertEqual(result, [2, 3, 12, 466])
//    }
//    
//    func test_음수_실수_각2개_add연산자_3개_숫자분리() {
//        let testAry = "2.22+-3.33+1.2+-466"
//        let result = ExpressionParser.parse(from: testAry).operands.inbox
//        XCTAssertEqual(result, [2.22, -3.33, 1.2, -466])
//    }
//    
//    func test_음수_실수_각2개_subtract연산자_3개_숫자분리() {
//        let testAry = "2.22−-3.33−1.2−-466"
//        let result = ExpressionParser.parse(from: testAry).operands.inbox
//        XCTAssertEqual(result, [2.22, -3.33, 1.2, -466])
//    }
//
//    func test_음수_실수_각2개_divide연산자_3개_숫자분리() {
//        let testAry = "2.22÷-3.33÷1.2÷-466"
//        let result = ExpressionParser.parse(from: testAry).operands.inbox
//        XCTAssertEqual(result, [2.22, -3.33, 1.2, -466])
//    }
//    
//    func test_음수_실수_각2개_multiply연산자_3개_숫자분리() {
//        let testAry = "2.22×-3.33×1.2×-466"
//        let result = ExpressionParser.parse(from: testAry).operands.inbox
//        XCTAssertEqual(result, [2.22, -3.33, 1.2, -466])
//    }
//    
//    func test_정수_음수_실수_각2개_연산자_5개_숫자분리() {
//        let testAry = "2.22×-3.33×67×1.2×-466×99"
//        let result = ExpressionParser.parse(from: testAry).operands.inbox
//        XCTAssertEqual(result, [2.22, -3.33, 67, 1.2, -466, 99])
//    }
//    
//    func test_복합수식_숫자분리() {
//        let testAry = "11+1.2−13×14.990÷15+16−-17×1.8÷19.999"
//        let result = ExpressionParser.parse(from: testAry).operands.inbox
//        XCTAssertEqual(result, [11, 1.2, 13, 14.990, 15, 16, -17, 1.8, 19.999])
//    }
//    
//    func test_복합수식_연산자분리() {
//        let testAry = "11+1.2−13×14.990÷15+16−-17×1.8÷19.999"
//        let result = ExpressionParser.parse(from: testAry).operators.inbox
//        XCTAssertEqual(result, [Operator.add, Operator.subtract, Operator.multiply, Operator.divide, Operator.add, Operator.subtract, Operator.multiply, Operator.divide])
//    }

}
