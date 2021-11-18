//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by LIMGAUI on 2021/11/17.
//

import Foundation
import XCTest

class FormulaTests: XCTestCase {
    var formula: Formula!
    var expressionParser: ExpressionParser!
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        formula = nil
        expressionParser = nil
    }
    
    func test_피연산자만필터하기() {
        //given
        let inputStrings = "257+43*6%2+0.05="
        let filterOperand : String = inputStrings.filter {
            Int(String($0)) == nil
        }
        //when
        let result = "+*%+.="
        //then
        XCTAssertEqual(result, filterOperand)
    }
    
    func test_연산자만필터하기() {
        //given
        let inputStrings = "257+43*6%2+0.05="
        let filterOperator: String = inputStrings.filter {
            Int(String($0)) != nil
        }
        //when
        let result = "2574362005"
        //then
        XCTAssertEqual(result, filterOperator)
    }
    
    func test_split메서드_형변환동작하는지_확인() {
        //given
        let string = "123/456+456*123"
        let after: [String] = ["123","456+456*123"]
        //when
        let result: [String] = string.split(with: "/")
        //then
        XCTAssertEqual(result, after)
    }
    
    func test_연산자를_기준으로_피연산자들에_분리가되는지_확인() {
        //given
        let string = "123/456+789*3-100"
        let after = ["123","456","789","3","100"]
        //when
        let result = ExpressionParser.makeOperators(from: string)
        //then
        XCTAssertEqual(result, after)
    }
    
    func test_연산자만분리되는지확인() {
        //given - 테스트를 위한 준비단계
        let string = "123/456+789*3-100"
        let after = ["/","+","*","-"]
        //when - 동작하는 단계
        let result = ExpressionParser.makeOperators(from: string)
        //then - 테스트결과 확인
        XCTAssertEqual(result, after)
    }
    
    func test_입력값의_연산이_되는지확인() {
        //given
        let string = "8/4+10-12+10"
        //when
        let after: Double = 10.0
        var testFormula = ExpressionParser.parse(from: string)
        let result = testFormula.result()
        //then
        XCTAssertEqual(result, after)
    }
}
