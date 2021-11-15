//
//  ParserTests.swift
//  CalculatorTests
//
//  Created by yeha on 2021/11/15.
//

import XCTest

class ExpressionParserTests: XCTestCase {
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
}
