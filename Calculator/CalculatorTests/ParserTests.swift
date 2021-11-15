//
//  ParserTests.swift
//  CalculatorTests
//
//  Created by yeha on 2021/11/15.
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
    
    func test_연산자_파싱() {
        let input = "1.1+2.2-3.3"
        let result = sut.parse(from: input)
        let expectedResult: Operator = .subtract
        XCTAssertEqual(result, expectedResult)
        
    }
}

class StringExtensionParserTests: XCTestCase {
    func test_양수_더하기_파싱() {
        let result = "1.1+2.2".split(with: Operator.add.rawValue)
        XCTAssertEqual(result, ["1.1", "2.2"])
    }
    
    func test_양수_곱하기_파싱() {
        let result = "1.1*2.2".split(with: Operator.multiply.rawValue)
        XCTAssertEqual(result, ["1.1", "2.2"])
    }
    
    func test_양수_나누기_파싱() {
        let result = "1.1/2.2".split(with: Operator.divide.rawValue)
        XCTAssertEqual(result, ["1.1", "2.2"])
    }
    
    func test_음수_파싱() {
        let result = "-1.1".split(with: Operator.subtract.rawValue)
        XCTAssertEqual(result, ["-1.1"])
    }

    func test_음수_더하기_파싱() {
        let result = "-1.1-2.2".split(with: Operator.subtract.rawValue)
        XCTAssertEqual(result, ["-1.1-2.2"])
    }
    
    func test_음수_곱하기_파싱() {
        let result = "-1.1*-2.2".split(with: Operator.multiply.rawValue)
        XCTAssertEqual(result, ["-1.1", "-2.2"])
    }
    
    func test_음수_나누기_파싱() {
        let result = "-1.1/-2.2".split(with: Operator.divide.rawValue)
        XCTAssertEqual(result, ["-1.1", "-2.2"])
    }
}
