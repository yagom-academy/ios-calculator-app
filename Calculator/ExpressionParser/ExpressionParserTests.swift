//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by Hemg on 2023/06/08.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    
    var formula: Formula!
    var operands: CalculatorItemQueue<Double>!
    var operators: CalculatorItemQueue<Operator>!
    
    override func setUpWithError() throws {
        operands = CalculatorItemQueue<Double>()
        operators = CalculatorItemQueue<Operator>()
        formula = Formula(operands: operands, operators: operators)
    }
    
    override func tearDownWithError() throws {
        formula = nil
        operands = nil
        operators = nil
    }
    
    func test_1_더하기_2_했을때_3이나오는지확인() {
        // Given
        let input = "1+2"
        
        // When
        formula = ExpressionParser.parse(from: input)
        let result = try! formula.result()
        
        // Then
        XCTAssertEqual(result, 3.0)
    }
    
    func test_1_더하기_2_더하기_1_했을때_3이나오는지확인() {
        // Given
        let input = "1+2+1"
        
        // When
        formula = ExpressionParser.parse(from: input)
        let result = try! formula.result()
        
        // Then
        XCTAssertEqual(result, 4.0)
    }
    
    func test_1_곱하기_2_했을때_2이나오는지확인() {
        // Given
        let input = "1×2"
        
        // When
        formula = ExpressionParser.parse(from: input)
        let result = try! formula.result()
        
        // Then
        XCTAssertEqual(result, 2.0)
    }
    
    func test_1_나누기_2_했을때_2이나오는지확인() {
        // Given
        let input = "1÷2"
        
        // When
        formula = ExpressionParser.parse(from: input)
        let result = try! formula.result()
        
        // Then
        XCTAssertEqual(result, 0.5)
    }
    
    func test_2_빼기_1_했을때_1이나오는지확인() {
        // Given
        let input = "2−1"
        
        // When
        formula = ExpressionParser.parse(from: input)
        let result = try! formula.result()
        
        // Then
        XCTAssertEqual(result, 1.0)
    }
    
    func test_2_빼기_음수1_했을때_1이나오는지확인() {
        // Given
        let input = "2−1"
        
        // When
        formula = ExpressionParser.parse(from: input)
        let result = try! formula.result()
        
        // Then
        XCTAssertEqual(result, 1.0)
    }
    
    func test_2_빼기_음수1_더하기_1_했을때_1이나오는지확인() {
        // Given
        let input = "2−1+1+1"
        
        // When
        formula = ExpressionParser.parse(from: input)
        let result = try! formula.result()
        
        // Then
        XCTAssertEqual(result, 3.0)
    }
    
    func test_음수2_빼기_음수1_했을때_1이나오는지확인() {
        // Given
        let input = "2−-1"
        
        // When
        formula = ExpressionParser.parse(from: input)
        let result = try! formula.result()
        
        // Then
        XCTAssertEqual(result, 3.0)
    }
}
