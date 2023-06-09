//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by Hemg on 2023/06/08.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    
    func test_1_더하기_2_했을때_3이나오는지확인() {
        // Given
        let input = "1+2"
        
        // When
        let parser = ExpressionParser.parse(from: input)
        
        // Then
        XCTAssertEqual(parser.operands.dequeueItem(), 1.0)
        XCTAssertEqual(parser.operators.dequeueItem(), .add)
        XCTAssertEqual(parser.operands.dequeueItem(), 2.0)
    }
    
    func test_1_더하기_2_더하기_1_했을때_4이나오는지확인() {
        // Given
        let input = "1+2+1"
        
        // When
        let parser = ExpressionParser.parse(from: input)
        
        // Then
        XCTAssertEqual(parser.operands.dequeueItem(), 1.0)
        XCTAssertEqual(parser.operators.dequeueItem(), .add)
        XCTAssertEqual(parser.operands.dequeueItem(), 2.0)
        XCTAssertEqual(parser.operators.dequeueItem(), .add)
        XCTAssertEqual(parser.operands.dequeueItem(), 1.0)
    }
    
    func test_1_곱하기_2_했을때_2이나오는지확인() {
        // Given
        let input = "1×2"
        
        // When
        let parser = ExpressionParser.parse(from: input)
        
        // Then
        XCTAssertEqual(parser.operands.dequeueItem(), 1.0)
        XCTAssertEqual(parser.operators.dequeueItem(), .multiply)
        XCTAssertEqual(parser.operands.dequeueItem(), 2.0)
    }
    
    func test_1_나누기_2_했을때_2이나오는지확인() {
        // Given
        let input = "1÷2"
        
        // When
        let parser = ExpressionParser.parse(from: input)
        
        // Then
        XCTAssertEqual(parser.operands.dequeueItem(), 1.0)
        XCTAssertEqual(parser.operands.dequeueItem(), 2.0)
        XCTAssertEqual(parser.operators.dequeueItem(), .divide)
    }
    
    func test_2_빼기_1_했을때_1이나오는지확인() {
        // Given
        let input = "2−1"
        
        // When
        let parser = ExpressionParser.parse(from: input)
        
        // Then
        XCTAssertEqual(parser.operands.dequeueItem(), 2.0)
        XCTAssertEqual(parser.operands.dequeueItem(), 1.0)
        XCTAssertEqual(parser.operators.dequeueItem(), .subtract)
    }
    
    func test_2_빼기_음수2_했을때_0이나오는지확인() {
        // Given
        let input = "2+2−2"
        
        // When
        let parser = ExpressionParser.parse(from: input)
        
        // Then
        XCTAssertEqual(parser.operands.dequeueItem(), 2.0)
        XCTAssertEqual(parser.operators.dequeueItem(), .add)
        XCTAssertEqual(parser.operands.dequeueItem(), 2.0)
        XCTAssertEqual(parser.operators.dequeueItem(), .subtract)
        XCTAssertEqual(parser.operands.dequeueItem(), 2.0)
    }
    
    func test_2_빼기_음수1_더하기_1_했을때_1이나오는지확인() {
        // Given
        let input = "2−1+1+1"
        
        // When
        let parser = ExpressionParser.parse(from: input)
        
        // Then
        XCTAssertEqual(parser.operands.dequeueItem(), 2.0)
        XCTAssertEqual(parser.operators.dequeueItem(), .subtract)
        XCTAssertEqual(parser.operands.dequeueItem(), 1.0)
        XCTAssertEqual(parser.operators.dequeueItem(), .add)
        XCTAssertEqual(parser.operands.dequeueItem(), 1.0)
        XCTAssertEqual(parser.operators.dequeueItem(), .add)
        XCTAssertEqual(parser.operands.dequeueItem(), 1.0)
    }
    
    func test_음수2_빼기_음수1_했을때_1이나오는지확인() {
        // Given
        let input = "-2−-1"
        
        // When
        let parser = ExpressionParser.parse(from: input)
        
        // Then
        XCTAssertEqual(parser.operands.dequeueItem(), -2.0)
        XCTAssertEqual(parser.operators.dequeueItem(), .subtract)
        XCTAssertEqual(parser.operands.dequeueItem(), -1.0)
    }
}
