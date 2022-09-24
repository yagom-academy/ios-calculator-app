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
    
    func test_계산하는값이_음수_부호를_가지고있을때_정상적으로_연산이_되는지(){
        let result: Double = 123
        var parse = try? ExpressionParser.parse(from: "234 + -111")
        
        XCTAssertEqual(result, try parse?.result())
    }

}
