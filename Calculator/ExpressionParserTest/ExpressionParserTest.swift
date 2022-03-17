//
//  ExpressionParserTest.swift
//  ExpressionParserTest
//
//  Created by DuDu on 2022/03/18.
//

import XCTest
@testable import Calculator

class ExpressionParserTest: XCTestCase {
    var sut: ExpressionParser.Type?
    
    override func setUpWithError() throws {
        sut = ExpressionParser.self
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_1_add_2_multiply_3을_parse했을때_Formula가_제대로만들어지고_result결과가_9여야한다() {
        //given
        let expression = "1 + 2 × 3"
        
        //when
        let result = try? sut?.parse(from: expression).result()
        
        //then
        XCTAssertEqual(result, 9)
    }
    
    func test_음수1_add_음수2_divide_10을_parse했을때_formula가_제대로만들어지고_result결과가_음수0쩜3이어야한다() {
        //given
        let expression = "-1 + -2 ÷ 10"
        
        //when
        let result = try? sut?.parse(from: expression).result()
        
        //then
        XCTAssertEqual(result, -0.3)
    }
}
