//
//  ExpressionParserTest.swift
//  ExpressionParserTest
//
//  Created by Kiwi on 2022/05/20.
//

import XCTest
@testable import Calculator
class ExpressionParserTest: XCTestCase {
    
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func test_하나의_식을_문자열값으로_받은_경우_연산이_올바르게_되어야한다() {
        //given
        let expression = "2 + 6 × 5 ÷ -2"
        //when
        var result = ExpressionParser.parse(from: expression)
        //then
        XCTAssertEqual(try result.result(), -20)
    }

}
