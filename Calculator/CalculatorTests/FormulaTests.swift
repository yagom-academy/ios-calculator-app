//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by yeha on 2021/11/15.
//

import XCTest

class FormulaTests: XCTestCase {
    func test_result_반환() {
        var formula = Formula()
        let result = formula.result()
        XCTAssertEqual(result, 1.1)
    }
}
