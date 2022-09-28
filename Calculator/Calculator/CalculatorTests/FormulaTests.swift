//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by 서수영 on 2022/09/28.
//

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    
    var sut: Formula!
    var testCase1:CalculatorItemQueue = CalculatorItemQueue([Double.random(in: 0...100), Operator.allCases.randomElement()])
    var testCase2:CalculatorItemQueue = CalculatorItemQueue([Double.random(in: 0...100), Operator.allCases.randomElement()])
    
    override func setUpWithError() throws {
        sut = Formula(operrands: testCase1, operators: testCase2)
    }

    override func tearDownWithError() throws {
        sut = nil
    }


}
