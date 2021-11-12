//
//  StringExtensionTest.swift
//  CalculatorItemQueueTests
//
//  Created by Seul Mac on 2021/11/12.
//

import XCTest

class StringExtensionTest: XCTestCase {
    
    func test_add연산자_1개_정수_2개_숫자분리 {
        let testString = "12+15"
        let result = testString.split(with: Operator.add.rawValue)
        XCTAssertEqual(result, ["12", "15"])
    }
    
    func test_subtract연산자_1개_정수_2개_숫자분리 {
        let testString = "12_15"
        let result = testString.split(with: Operator.subtract.rawValue)
        XCTAssertEqual(result, ["12", "15"])
    }
    
    func test_divide연산자_1개_정수_2개_숫자분리 {
        let testString = "12/15"
        let result = testString.split(with: Operator.divide.rawValue)
        XCTAssertEqual(result, ["12", "15"])
    }
    
    func test_multiply연산자_1개_정수_2개_숫자분리 {
        let testString = "12×15"
        let result = testString.split(with: Operator.multiply.rawValue)
        XCTAssertEqual(result, ["12", "15"])
    }
    
    func test_add연산자_2개_정수_3개_숫자분리 {
        let testString = "12+15+23"
        let result = testString.split(with: Operator.add.rawValue)
        XCTAssertEqual(result, ["12", "15", "23"])
    }
    
    func test_subtract연산자_2개_정수_3개_숫자분리 {
        let testString = "12_15_23"
        let result = testString.split(with: Operator.subtract.rawValue)
        XCTAssertEqual(result, ["12", "15", "23"])
    }
    
    func test_divide연산자_2개_정수_3개_숫자분리 {
        let testString = "12/15/23"
        let result = testString.split(with: Operator.divide.rawValue)
        XCTAssertEqual(result, ["12", "15", "23"])
    }
    
    func test_multiply연산자_2개_정수_3개_숫자분리 {
        let testString = "12×15×23"
        let result = testString.split(with: Operator.multiply.rawValue)
        XCTAssertEqual(result, ["12", "15", "23"])
    }
    
}
