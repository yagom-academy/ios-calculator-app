//
//  ExpressionParserTest.swift
//  ExpressionParserTest
//
//  Created by Lee minyeol on 2023/10/10.
//

import XCTest
@testable import Calculator

final class ExpressionParserTest: XCTestCase {
    
    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
    }
    
    func test_Stirng값이주어질떄_parse를_실행하면_Formula인스턴스에_operand큐가추가된다() {
        //given
        let number = "1 + 1"
        //when
        let result = ExpressionParser.parse(from: number)
        //then
        XCTAssertTrue(result.operands.isEmpty)
    }
    
    func test_Stirng값이주어질떄_parse를_실행하면_Formula인스턴스에_operators큐가추가된다() {
        //given
        let number = "2 + 3"
        //when
        let result = ExpressionParser.parse(from: number)
        //then
        XCTAssertTrue(result.operators.isEmpty)
    }

}
