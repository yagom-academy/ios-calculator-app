//
//  ExpressionParserTests.swift
//  Calculator
//
//  Created by 유한석 on 2022/05/20.
//

import XCTest

class ExpressionParserTests: XCTestCase {
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
// MARK: - ExpressionParser.parse
    func test_숫자만입력한경우_숫자그대로출력(){
        //given
        let input = "15"
        //when
        var formula = ExpressionParser.parse(from: input)
        let result = formula.result()
        //then
        XCTAssertEqual(result, 15.0)
    }
    
    func test_숫자_연산자_입력한경우_숫자그대로출력(){
        //given
        let input = "15+"
        //when
        var formula = ExpressionParser.parse(from: input)
        let result = formula.result()
        //then
        XCTAssertEqual(result, 15.0)
    }
    
    func test_숫자_연산자_숫자_입력한경우_연산결과출력(){
        //given
        let input = "15+9"
        //when
        var formula = ExpressionParser.parse(from: input)
        let result = formula.result()
        //then
        XCTAssertEqual(result, 24.0)
    }
    
    func test_숫자_연산자_숫자_연산자_입력한경우_연산결과출력(){
        //given
        let input = "15+9-"
        //when
        var formula = ExpressionParser.parse(from: input)
        let result = formula.result()
        //then
        XCTAssertEqual(result, 24.0)
    }
    
    func test_숫자_연산자_숫자_연산자_숫자_입력한경우_연산결과출력(){
        //given
        let input = "15+9/2"
        //when
        var formula = ExpressionParser.parse(from: input)
        let result = formula.result()
        //then
        XCTAssertEqual(result, 12.0)
    }
    
    func test_0으로나누면_에러처리(){
        //given
        //when
        //then
    }
}
