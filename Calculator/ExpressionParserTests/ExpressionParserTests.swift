//  ExpressionParserTests.swift
//  ExpressionParserTests
//  Created by LJ on 2022/09/23.

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
    var sut: ExpressionParser!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func test_피연산자_정상추출되는지(){
        //given
        let input: String = "10+20*3/2+3-2*9"
        
        //when
        let resultFormula = ExpressionParser.parse(from: input)
        
        //then
        XCTAssertEqual(resultFormula.operands.enqueueStack, [10.0,20.0,3.0,2.0,3.0,2.0,9.0])
    }
    
    func test_연산자_정상추출되는지(){
        //given
        let input: String = "10+20*3/2+3-2*9"

        //when
        let resultFormula = ExpressionParser.parse(from: input)

        //then
        XCTAssertEqual(resultFormula.operators.enqueueStack, [.add,.multiply,.divide,.add,.subtract,.multiply])
    }
    
//    func test_숫자2개_연산자1개_계산되는지(){
//        //given
//        let input: String = "99.9+0.1"
//
//        //when
//        var resultFormula: Formula = ExpressionParser.parse(from: input)
//        let resultValue: Double = resultFormula.result()
//
//        //then
//        XCTAssertEqual(resultValue, 100.0)
//    }
//
//    func test_숫자3개_연산자3개_계산되는지(){
//        //given
//        let input: String = "99.9+10.1+7-10*0"
//
//        //when
//        var resultFormula: Formula = ExpressionParser.parse(from: input)
//        let resultValue: Double = resultFormula.result()
//
//        //then
//        XCTAssertEqual(resultValue, 77)
//    }
}
