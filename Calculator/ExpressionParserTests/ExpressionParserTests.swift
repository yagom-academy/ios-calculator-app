//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by Mangdi on 2022/09/23.
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
    
    func test_parse_호출할때_input아무것도없다면_0을반환하는가() {
        var formula = ExpressionParser.parse(from: "")
        let result = formula.operands?.dequeue()
        
        XCTAssertEqual(0, result)
    }
    
    func test_parse_호출할때_input에_Double형값1개를넣는다면_그값이반환되는가() {
        var formula = ExpressionParser.parse(from: "80")
        let result = formula.operands?.dequeue()
        
        XCTAssertEqual(80, result)
    }
    
    func test_parse_호출할때_input에_Double형값1개와_Operator타입1개값을넣는다면_그값이반환되는가() {
        var formula = ExpressionParser.parse(from: "80+")
        let result = formula.operands?.dequeue()
        
        XCTAssertEqual(80, result)
    }
}
