//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by leewonseok on 2022/09/21.
//

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
    
    override func setUpWithError() throws { }

    override func tearDownWithError() throws { }
    
    func test_string값의_식의_결과값이_356일때_string내부의값을_parse하여_연산한_결과값이_356와일치하는지() {
        let result: Double = 356
        var parse = try? ExpressionParser.parse(from: "123 + 233")

        XCTAssertEqual(result, try parse?.result())
    }
    
    func test_양수234과_음수111_을_연산했을때_결과값으로_123이_나오는지(){
        let result: Double = 123
        var parse = try? ExpressionParser.parse(from: "234 + -111")
        
        XCTAssertEqual(result, try parse?.result())
    }
    
    func test_양수233과_음수111을_곱하고_음수2로나누었을때_정상적인_값이_출력되는지() {
        let result: Double = (233 * -111) / -2
        var parse = try? ExpressionParser.parse(from: "233 * -111 / -2")
        
        XCTAssertEqual(result, try parse?.result())
    }

}
