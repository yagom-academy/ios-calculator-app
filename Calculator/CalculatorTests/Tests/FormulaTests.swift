//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by Jun Bang on 2021/11/12.
//

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    var mockOperandQueue: CalculatorItemQueue<Int>!
    var mockOperatorQueue: CalculatorItemQueue<String>!
    var sut: Formula!
    override func setUpWithError() throws {
        mockOperandQueue = CalculatorItemQueue<Int>()
        mockOperatorQueue = CalculatorItemQueue<String>()
        sut = Formula(operands: operandQueue, operators: operatorQueue)
    }

    override func tearDownWithError() throws {
        mockOperandQueue = nil
        mockOperatorQueue = nil
        sut = nil
    }
}
