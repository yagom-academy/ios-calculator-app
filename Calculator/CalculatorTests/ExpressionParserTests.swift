//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by mene on 22/9/2022.
//

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
    var sut: ExpressionParser!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_1더하기2를입력했을때_숫자배열이순서대로반환되는지확인() {
        // given
        let input = "1+2"
        
        // when
        let result = ExpressionParser.componentsByOperators(from: input)
        
        // then
       XCTAssertEqual(result, ["1", "2"])
    }
    
    func test_1더하기2더하기3을입력했을때_숫자배열이순서대로반환되는지확인() {
        // given
        let input = "1+2+3"
        
        // when
        let result = ExpressionParser.componentsByOperators(from: input)
        
        // then
       XCTAssertEqual(result, ["1", "2", "3"])
    }
    
    func test_1뺴기2빼기3을입력했을때_숫자배열이순서대로반환되는지확인() {
        // given
        let input = "1-2-3"
        
        // when
        let result = ExpressionParser.componentsByOperators(from: input)
        
        // then
       XCTAssertEqual(result, ["1", "2", "3"])
    }
    
    func test_1곱하기2곱하기3곱하기를입력했을때_숫자배열이순서대로반환되는지확인() {
        // given
        let input = "1✕2✕3"
        
        // when
        let result = ExpressionParser.componentsByOperators(from: input)
        
        // then
       XCTAssertEqual(result, ["1", "2", "3"])
    }
    
    func test_10나누기5나누기2를입력했을때_숫자배열이순서대로반환되는지확인() {
        // given
        let input = "10÷5÷2"
        
        // when
        let result = ExpressionParser.componentsByOperators(from: input)
        
        // then
       XCTAssertEqual(result, ["10", "5", "2"])
    }
    
    func test_1곱하기10빼기5나누기2를입력했을때_숫자배열이순서대로반환되는지확인() {
        // given
        let input = "1✕10-5÷2"
        
        // when
        let result = ExpressionParser.componentsByOperators(from: input)
        
        // then
       XCTAssertEqual(result, ["1", "10", "5", "2"])
    }

}
