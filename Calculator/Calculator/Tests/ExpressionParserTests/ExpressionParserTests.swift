//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by parkhyo on 2022/09/23.
//

import XCTest

@testable import Calculator
class ExpressionParserTests: XCTestCase {
    
    func test_parse_test() {
        let input = "123+234-2*8"
        let result = ExpressionParser.parse(from: input).result()
        XCTAssertEqual(result, (123+234-2)*8)
    }
    
    func test_operands_check() {
        let input = "123+234-2*8"
        let result = ExpressionParser.parse(from: input).operands
        
        let inputOperands = ["123", "234", "2", "8"]
        var testResult = true
        for item in inputOperands {
            if Double(item) == result.dequeue() {
                testResult = true
            } else {
                testResult = false
            }
        }
        XCTAssertTrue(testResult)
    }
    
    func test_operators_check() {
        let input = "123+234-2*8"
        let result = ExpressionParser.parse(from: input).operators
        
        let inputOperators = ["+", "-", "*"]
        var testResult = true
        
    
        for item in inputOperators {
            if Operator(rawValue: Character(item)) == result.dequeue() {
                testResult = true
            } else {
                testResult = false
            }
        }
        XCTAssertTrue(testResult)
    }
    
    func test_empty_operands_check() {
        let input = ""
        let result = ExpressionParser.parse(from: input).operands
        
        let inputOperands: [String] = []
        var testResult = true
        for item in inputOperands {
            if Double(item) == result.dequeue() {
                testResult = true
            } else {
                testResult = false
            }
        }
        XCTAssertTrue(testResult)
    }
    
    func test_empty_operators_check() {
        let input = ""
        let result = ExpressionParser.parse(from: input).operators
        
        let inputOperators: [String] = []
        var testResult = true
        for item in inputOperators {
            if Operator(rawValue: Character(item)) == result.dequeue() {
                testResult = true
            } else {
                testResult = false
            }
        }
        XCTAssertTrue(testResult)
    }
    
}
