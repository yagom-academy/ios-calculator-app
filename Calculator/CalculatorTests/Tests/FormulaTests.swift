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
    
    func testFormulaResult_given30Add20Subtract10_expect40() {
        let testOperands: [Double] = [30, 20, 10]
        let testOperators: [Operator] = [.add, .subtract]
        setup(formula: &sut, with: testOperands, and: testOperators)
        XCTAssertEqual(sut.result(), 40)
    }
    
    func testFormulaResult_givenNoNumberAndAdd_expectNaN() {
        let testOperands: [Double] = []
        let testOperators: [Operator] = [.add]
        setup(formula: &sut, with: testOperands, and: testOperators)
        XCTAssertTrue(sut.result().isNaN)
    }
    
    func testFormulaResult_given30Add20Subtract10Divide20_expect2() {
        let testOperands: [Double] = [30, 20, 10, 20]
        let testOperators: [Operator] = [.add, .subtract, .divide]
        setup(formula: &sut, with: testOperands, and: testOperators)
        XCTAssertEqual(sut.result(), 2)
    }
    
    func testFormulaResult_given30Divide10Divide10_expectOpoint3() {
        let testOperands: [Double] = [30, 10, 10]
        let testOperators: [Operator] = [.divide, .divide]
        setup(formula: &sut, with: testOperands, and: testOperators)
        XCTAssertEqual(sut.result(), 0.3)
    }
    
    func testFormulaResult_given30Multiply20Multiply10_expect6000() {
        let testOperands: [Double] = [30, 20, 10]
        let testOperators: [Operator] = [.multiply, .multiply]
        setup(formula: &sut, with: testOperands, and: testOperators)
        XCTAssertEqual(sut.result(), 6000)
    }
    
    func testFormulaResult_given100Divide0_expectNaN() {
        let testOperands: [Double] = [100, 0]
        let testOperators: [Operator] = [.divide]
        setup(formula: &sut, with: testOperands, and: testOperators)
        XCTAssertTrue(sut.result().isNaN)
    }
    
    func testFormulaResult_given2Add3Multiply3Subtract1_expect14() {
        let testOperands: [Double] = [2, 3, 3, 1]
        let testOperators: [Operator] = [.add, .multiply, .subtract]
        setup(formula: &sut, with: testOperands, and: testOperators)
        XCTAssertEqual(sut.result(), 14)
    }
    
    func testFormulaResult_given3Divide3Add2Subtract1_expect2() {
        let testOperands: [Double] = [3, 3, 2, 1]
        let testOperators: [Operator] = [.divide, .add, .subtract]
        setup(formula: &sut, with: testOperands, and: testOperators)
        XCTAssertEqual(sut.result(), 2)
    }
    
    func testFormulaResult_given1Add2Subtract3Multiply2Subtract3Divide6_expectNegativeZeroPoint5() {
        let testOperands: [Double] = [1, 2, 3, 2, -3, 6]
        let testOperators: [Operator] = [.add, .subtract, .multiply, .subtract, .divide]
        setup(formula: &sut, with: testOperands, and: testOperators)
        XCTAssertEqual(sut.result(), -0.5)
    }
    
    private func setup(formula: inout Formula, with operands: [Double], and operators: [Operator]) {
        insert(contentsOf: operands, into: &formula.operands)
        insert(contentsOf: operators, into: &formula.operators)
    }
    
    private func insert<T>(contentsOf testData: [T], into queue: inout CalculatorItemQueue<T>) {
        for data in testData {
            queue.enqueue(data)
        }
    }
}
