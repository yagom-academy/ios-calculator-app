//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by 김동욱 on 2022/03/19.
//

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {

    var sut: ExpressionParser.Type!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ExpressionParser.self
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_parse_input값을_Double과_Operator로_나누어_가지는_Fomula를_반환해_result메서드의_결과값을_비교() {
        let input = "123 + -123 * 2 + 3 / 1"
        var test = sut.parse(from: input)
        
        XCTAssertEqual(test.result(), 3)
    }
}
