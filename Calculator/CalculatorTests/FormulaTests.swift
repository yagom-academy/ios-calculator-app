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
}
