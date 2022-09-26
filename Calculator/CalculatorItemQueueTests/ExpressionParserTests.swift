//
//  ExpressionParserTests.swift
//  Created by 미니.
//
import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    func test_연산자와피연산자의문자가모드정상적인경우결과가예측치와동일한지() {
        // driven
        let input: String = "10+9*8-7/6"
        // when
        let form: Formula = ExpressionParser.parse(from: input)
        let result = form.result()
        
        // then
        XCTAssertEqual(result, 24.166666666666667)
    }
    
    func test_연산자가될수없는연산자가포함되어있는경우결과가예측치와동일한지() {
        // driven
        let input: String = "10+9*8-7^6"
        
        // when
        let form: Formula = ExpressionParser.parse(from: input)
        let result = form.result()
        
        // then
        XCTAssertEqual(result, 76)
    }
    
    func test_피연산자가될수없는문자열이포함되어있는경우결과가예측치와동일한지() {
        // driven
        let input: String = "10d+9*8-76"
        // when
        let form: Formula = ExpressionParser.parse(from: input)
        let result = form.result()
        
        // then
        XCTAssertEqual(result, 76)
    }
    
    func test_연산자에음수가포함될경우결과가예측치와동일한지() {
        // driven
        let input: String = "10+-7+10"
        // when
        let form: Formula = ExpressionParser.parse(from: input)
        let result = form.result()
        // then
        XCTAssertEqual(result, 13)
        
    }
}
