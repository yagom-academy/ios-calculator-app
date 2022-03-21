//
//  ExpressionParserTest.swift
//  ModelTests
//
//  Created by Red on 2022/03/18.
//

import XCTest
@testable import Calculator

class ExpressionParserTest: XCTestCase {
    
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func test_parse() {
        var formula = ExpressionParser.parse(form: "-10 + +2 - -3 × 4")
        
        let result = formula.result()
        
        XCTAssertEqual(result, -20.0)
    }
    
    func test_parse_잘못된인풋() {
        var formula = ExpressionParser.parse(form: "-10 - + 10 +2 - -3 × 7 4 +")
        
        let result = formula.result()
        
        XCTAssertEqual(result, -20.0)
    }
}
