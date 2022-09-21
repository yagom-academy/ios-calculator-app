//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by leewonseok on 2022/09/21.
//

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
    
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
        
    }
    
    func test_정상적으로_parse되는지() {
        let result: Double = 356
        var parse = try? ExpressionParser.parse(from: "123+233")
        
        XCTAssertEqual(result, try parse?.result())
    }
    
    func test_연산자와_숫자_이외의_값이들어갔을때_Error를_던지는지() {
        XCTAssertThrowsError(try ExpressionParser.parse(from: "123###123"))
    }
    
}
