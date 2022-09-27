//
//  ExpressionParserTest.swift
//  ExpressionParserTest
//
//  Created by 서현웅 on 2022/09/28.
//

import XCTest
@testable import Calculator

class ExpressionParserTest: XCTestCase {

    var sut: ExpressionParser!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_componentsByOperators_실행시_숫자값이배열로반환되는가() {
        // given
        let input = "45+1-31*59/30"
        // when
        let result = ExpressionParser.componentsByOperators(from: input)
        // then
        XCTAssertEqual(result, ["45","1","31","59","30"])
    }
    
    func test_componentsByOperators_실행시_음수값넣었을때숫자값이배열로반환되는가() {
        // given
        let input = "45-m3"
        // when
        let result = ExpressionParser.componentsByOperators(from: input)
        // then
        XCTAssertEqual(result, ["45","m3"])
    }

}
