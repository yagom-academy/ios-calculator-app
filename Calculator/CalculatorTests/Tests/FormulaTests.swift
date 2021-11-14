//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by Jun Bang on 2021/11/12.
//

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    var mockOperandCalculatorItemQueue!
    var mockOperatorCalculatorItemQueue!
    var sut: Formula!
    
    override func setUpWithError() throws {
        mockOperandCalculatorItemQueue = CalculatorItemQueue<Double>()
        mockOperatorCalculatorItemQueue = CalculatorItemQueue<Operator>()
        sut = Formula()
    }

    override func tearDownWithError() throws {
        mockOperandCalculatorItemQueue = nil
        mockOperatorCalculatorItemQueue = nil
        sut = nil
    }
    
    func testFormulaResult_given30Plus20Minus10_expect40() {
        let testOperators: [Operator] = [.add, .subtract]
        setup(sut.operators, with: testOperators)
        let testOperands: [Double] = [30, 20, 10]
        setup(sut.operands, with: testOperands)
        XCTAssertEqual(sut.result(), 40)
    }
}
