//
//  ExpressionParserTests.swift
//  CalculatorTests
//

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
    var sut: ExpressionParser.Type?
    
    let testCase1 = "12+34+56+78"
    let testCase2 = "12-34-56-78"
    let testCase3 = "12*34*56*78"
    let testCase4 = "12/34/56/78"
    let testCase5 = "12+34-56*78/910"
    let testCase6 = "12.3+17.7"
    
    let testResult1 = ["12", "34", "56", "78"]
    let testResult5 = ["12", "34", "56", "78", "910"]
    let testResult6 = ["12.3", "17.7"]
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ExpressionParser.self
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    // MARK: - componentsByOperators test
    func test_더하기연산자가_포함되어있을때_배열이_순서대로_반환되는지() {
        let result = sut?.componentsByOperators(from: testCase1)
        
        XCTAssertEqual(result, testResult1)
    }
    
    func test_빼기연산자가_포함되어있을때_배열이_순서대로_반환되는지() {
        let result = sut?.componentsByOperators(from: testCase2)
        
        XCTAssertEqual(result, testResult1)
    }
    
    func test_곱하기연산자가_포함되어있을때_배열이_순서대로_반환되는지() {
        let result = sut?.componentsByOperators(from: testCase3)

        XCTAssertEqual(result, testResult1)
    }
    
    func test_나누기연산자가_포함되어있을때_배열이_순서대로_반환되는지() {
        let result = sut?.componentsByOperators(from: testCase4)
        
        XCTAssertEqual(result, testResult1)
    }
    
    func test_여러연산자가_포함되어있을때_배열이_순서대로_반환되는지() {
        let result = sut?.componentsByOperators(from: testCase5)
        
        XCTAssertEqual(result, testResult5)
    }
    
    func test_더블타입의_숫자가_포함되어있을때_배열이_순서대로_반환되는지() {
        let result = sut?.componentsByOperators(from: testCase6)

        XCTAssertEqual(result, testResult6)
    }
    
    
}
