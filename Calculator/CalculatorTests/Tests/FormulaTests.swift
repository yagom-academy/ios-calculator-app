//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by Jun Bang on 2021/11/12.
//

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    var mockOperandCalculatorItemQueue: CalculatorItemQueue<Double>!
    var mockOperatorCalculatorItemQueue: CalculatorItemQueue<Operator>!
    var sut: Formula!
    
    override func setUpWithError() throws {
        mockOperandCalculatorItemQueue = CalculatorItemQueue<Double>()
        mockOperatorCalculatorItemQueue = CalculatorItemQueue<Operator>()
        sut = Formula(operands: mockOperandCalculatorItemQueue, operators: mockOperatorCalculatorItemQueue)
    }

    override func tearDownWithError() throws {
        mockOperandCalculatorItemQueue = nil
        mockOperatorCalculatorItemQueue = nil
        sut = nil
    }
    
    func testFormulaResult_given30Plus20Minus10_expect40() {
        let testOperands: [Double] = [30, 20, 10]
        setup(queue: &sut.operands, with: testOperands)
        let testOperators: [Operator] = [.add, .subtract]
        setup(queue: &sut.operators, with: testOperators)
        XCTAssertEqual(sut.result(), 40)
    }
    
    func testFormulaResult_givenNoNumberAndPlus_expectNaN() {
        let testOperands: [Double] = []
        setup(queue: &sut.operands, with: testOperands)
        let testOperators: [Operator] = [.add]
        setup(queue: &sut.operators, with: testOperators)
        let test = sut.result()
        XCTAssertTrue(test.isNaN)
    }
    
    private func setup<T>(queue: inout CalculatorItemQueue<T>, with testData: [T]) {
        for data in testData {
            queue.enqueue(data)
        }
    }
}
