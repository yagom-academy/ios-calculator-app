//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by yeha on 2021/11/16.
//

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
    var sut: ExpressionParser.Type!

    override func setUp() {
        super.setUp()
        sut = ExpressionParser.self
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func test_양수_더하기_연산_수행() {
        let input = "1.1+2.2"
        var result = sut.parse(from: input)
        let expectedResult: Double = 1.1 + 2.2
        XCTAssertEqual(result.result(), expectedResult)
    }
    
    func test_양수_빼기_연산_수행() {
        let input = "1.1_2.2"
        var result = sut.parse(from: input)
        let expectedResult: Double = 1.1 - 2.2
        XCTAssertEqual(result.result(), expectedResult)
    }
    
    func test_양수_곱하기_연산_수행() {
        let input = "1.1*2.2"
        var result = sut.parse(from: input)
        let expectedResult: Double = 1.1 * 2.2
        XCTAssertEqual(result.result(), expectedResult)
    }
    
    func test_양수_나누기_연산_수행() {
        let input = "1.1/2.2"
        var result = sut.parse(from: input)
        let expectedResult: Double = 1.1 / 2.2
        XCTAssertEqual(result.result(), expectedResult)
    }
    
    func test_양수_혼합_연산_수행() {
        let input = "1.1/2.2*3.3+4.4"
        var result = sut.parse(from: input)
        let expectedResult: Double = 1.1 / 2.2 * 3.3 + 4.4
        XCTAssertEqual(result.result(), expectedResult)
    }
    
    func test_음수_더하기_연산_수행() {
        let input = "-1.1_2.2"
        var result = sut.parse(from: input)
        let expectedResult: Double = -1.1 + -2.2
        let formattedResult = Double(String(format: "%.2f", result.result()))
        let formattedExpectedResult = Double(String(format: "%.2f", expectedResult))
        XCTAssertEqual(formattedResult, formattedExpectedResult)
    }
    
    func test_음수_곱하기_연산_수행() {
        let input = "1.1*-2.2"
        var result = sut.parse(from: input)
        let expectedResult: Double = 1.1 * -2.2
        XCTAssertEqual(result.result(), expectedResult)
    }
    
    func test_음수_나누기_연산_수행() {
        let input = "1.1/-2.2"
        var result = sut.parse(from: input)
        let expectedResult: Double = 1.1 / -2.2
        XCTAssertEqual(result.result(), expectedResult)
    }
    
    func test_음수_혼합_연산_수행() {
        let input = "-1.1/-2.2*-3.3_4.4"
        var result = sut.parse(from: input)
        let expectedResult: Double = -1.1 / -2.2 * -3.3 + -4.4
        XCTAssertEqual(result.result(), expectedResult)
    }
}
