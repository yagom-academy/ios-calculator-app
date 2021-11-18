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
}
