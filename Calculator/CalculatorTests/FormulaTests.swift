//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by 이호영 on 2021/11/12.
//

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    
    var formula: Formula = Formula()

    func test_formula내_연산자피연산자프로퍼티를_가지고_연산결과를_나타낸다() {
        formula = ExpressionParser.parse(from: "15*-1+0.4")
        
        XCTAssertEqual(formula.result(), -14.6)
    }
    
    func test_formula내_연산자피연산자가nil값이면_0을_나타낸다() {
        formula = ExpressionParser.parse(from: "")
        
        XCTAssertEqual(formula.result(), 0.0)
    }
    
    func test_formula내_연산자nil값이면_피연산자만을_나타낸다() {
        formula = ExpressionParser.parse(from: "0.2")
        
        XCTAssertEqual(formula.result(), 0.2)
    }

    func test_formula내_0으로나누는_연산이_포함되는_계산식은_nan결과를_나타낸다() {
        formula = ExpressionParser.parse(from: "-1/0.0")
        
        XCTAssertTrue(formula.result().isNaN)
    }
}
