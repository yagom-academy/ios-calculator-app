//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by 김태현 on 2022/03/18.
//

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func test_parse_formula_result확인() {
        let formula = ExpressionParser.parse(from: "-10*-46+-50/+1")
        
        XCTAssertEqual(try! formula.result(), 410)
    }
}
