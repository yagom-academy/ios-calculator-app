//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by 이호영 on 2021/11/12.
//

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    
    var formula: Formula?

    override func setUpWithError() throws {
        formula = Formula()
    }
    
    override func tearDownWithError() throws {
        formula = nil
    }

    func test_calculate() {
        formula = ExpressionParser.parse(from: "15*-1+0.4")
        
        XCTAssertEqual(formula?.result(), -14.6)
    }

}
