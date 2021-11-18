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
}
