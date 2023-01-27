//
//  ExpressionParserTest.swift
//  ExpressionParserTest
//
//  Created by 천승현 on 2023/01/27.
//

import XCTest

final class ExpressionParserTest: XCTestCase {
    var sut: ExpressionParser!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ExpressionParser()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_componentnsByOperators호출시_3_더하기_5_곱하기_2_빼기_10을_인자로받으면_문자열배열3_5_2_10_을반환한다() {
        // given
        let input = "3+5*2-10"
        let expectation = ["3", "5", "2", "10"]
        
        // when
        let result = sut.componentnsByOperators(from: input)
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_componentnsByOperators호출시_3_빼기_음수3_곱하기_4_곱하기_2는_문자열배열3_음수3_4_2를반환한다() {
        // given
        let input = "3-⎼3*4*2"
        let expectation = ["3", "⎼3", "4", "2"]
        
        // when
        let result = sut.componentnsByOperators(from: input)
        
        // then
        XCTAssertEqual(result, expectation)
    }
}
