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
    
    func test_더하기와_곱하기연산이_주어졌을때_연산자우선순위와_관계없이_주어진순서대로_연산되어야한다() {
        //given
        let expression = "1 + 2 × 3"
        
        //when
        let result = try? sut?.parse(from: expression).result()
        
        //then
        XCTAssertEqual(result, 9)
    }
    
    func test_음수와_양수를_나누는연산이_주어졌을때_나누기법칙에맞게_연산되어야한다() {
        //given
        let expression = "-1 + -2 ÷ 10"
        
        //when
        let result = try? sut?.parse(from: expression).result()
        
        //then
        XCTAssertEqual(result, -0.3)
    }
}
