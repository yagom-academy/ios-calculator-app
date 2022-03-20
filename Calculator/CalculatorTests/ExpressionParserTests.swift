//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by 이시원 on 2022/03/18.
//

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {

    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {

    }
    
    func test_parse_return_type_Formula() {
        // given

        // when
        let result = ExpressionParser.parse(from: "1 + 2 × -3") is Formula

        // then
        XCTAssertTrue(result)
        
    }
    
    func test_parse에_1_플러스_2_곱하기_마이너스3_입력_parse의_result_return_마이너스9() {
        // given

        // when
        let result = ExpressionParser.parse(from: "1 + 2 × -3").result()

        // then
        XCTAssertEqual(result, -9.0)
    }

}
