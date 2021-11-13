//
//  ExpressionParserTest.swift
//  CalculatorTests
//
//  Created by Seul Mac on 2021/11/12.
//

import XCTest

class ExpressionParserTest: XCTestCase {
    var sut: ExpressionParser.Type! = ExpressionParser.self
    
    func test_정수_2개_add연산자_1개인_배열_2개_숫자분리() {
        let testAry = ["2+3", "12+466"]
        let result = sut.componentsByOneOperator(from: testAry, with: Operator.add.rawValue)
        XCTAssertEqual(result, ["2", "3", "12", "466"])
    }
    
    func test_정수_2개_subtract연산자_1개인_배열_2개_숫자분리() {
        let testAry = ["2_3", "12_466"]
        let result = sut.componentsByOneOperator(from: testAry, with: Operator.subtract.rawValue)
        XCTAssertEqual(result, ["2", "3", "12", "466"])
    }

    func test_정수_2개_divide연산자_1개인_배열_2개_숫자분리() {
        let testAry = ["2/3", "12/466"]
        let result = sut.componentsByOneOperator(from: testAry, with: Operator.divide.rawValue)
        XCTAssertEqual(result, ["2", "3", "12", "466"])
    }
    
    func test_정수_2개_multiply연산자_1개인_배열_2개_숫자분리() {
        let testAry = ["2×3", "12×466"]
        let result = sut.componentsByOneOperator(from: testAry, with: Operator.multiply.rawValue)
        XCTAssertEqual(result, ["2", "3", "12", "466"])
    }
    
    func test_음수_실수_각1개_add연산자_1개인_배열_2개_숫자분리() {
        let testAry = ["2.22+-3.33", "1.2+-466"]
        let result = sut.componentsByOneOperator(from: testAry, with: Operator.add.rawValue)
        XCTAssertEqual(result, ["2.22", "-3.33", "1.2", "-466"])
    }
    
    func test_음수_실수_각1개_subtract연산자_1개인_배열_2개_숫자분리() {
        let testAry = ["2.22_-3.33", "1.2_-466"]
        let result = sut.componentsByOneOperator(from: testAry, with: Operator.subtract.rawValue)
        XCTAssertEqual(result, ["2.22", "-3.33", "1.2", "-466"])
    }

    func test_음수_실수_각1개_divide연산자_1개인_배열_2개_숫자분리() {
        let testAry = ["2.22/-3.33", "1.2/-466"]
        let result = sut.componentsByOneOperator(from: testAry, with: Operator.divide.rawValue)
        XCTAssertEqual(result, ["2.22", "-3.33", "1.2", "-466"])
    }
    
    func test_음수_실수_각1개_multiply연산자_1개인_배열_2개_숫자분리() {
        let testAry = ["2.22×-3.33", "1.2×-466"]
        let result = sut.componentsByOneOperator(from: testAry, with: Operator.multiply.rawValue)
        XCTAssertEqual(result, ["2.22", "-3.33", "1.2", "-466"])
    }
    
    func test_정수_음수_실수_각1개_연산자_2개인_배열_2개_숫자분리() {
        let testAry = ["2.22×-3.33×67", "1.2×-466×99"]
        let result = sut.componentsByOneOperator(from: testAry, with: Operator.multiply.rawValue)
        XCTAssertEqual(result, ["2.22", "-3.33", "67", "1.2", "-466", "99"])
    }

}
