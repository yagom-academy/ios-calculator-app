//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by kaki on 2023/01/27.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var sut: Formula!

    override func setUpWithError() throws {
        try super.setUpWithError()
        let operands = CalculatorItemQueue<Double>()
        let operators = CalculatorItemQueue<Operator>()
        
        sut = Formula(operands: operands, operaters: operators)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_operands_큐가_비어있을때_zero를_반환한다() {
        // given
        let expectation: Double = .zero
        // when
        let result = sut.result()
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_operands_큐에_한개만_존재하고_operaters_큐가_비었을_경우_result로_반환한다() {
        // given
        sut.operands.enqueue(1.0)
        let expectation = 1.0
        // when
        let result = sut.result()
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_operands_큐에_한개만_존재하고_operaters_큐가_비어있지_않을_경우_result로_반환한다() {
        // given
        sut.operands.enqueue(1.0)
        sut.operaters.enqueue(Operator.add)
        sut.operaters.enqueue(Operator.multiply)
        let expectation = 1.0
        // when
        let result = sut.result()
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_operands_큐에_여러개가_존재하고_operaters_큐가_비어있지_않을_경우_순차적으로_계산한다() {
        // given
        sut.operands.enqueue(1.0)
        sut.operands.enqueue(3.0)
        sut.operands.enqueue(4.0)
        sut.operands.enqueue(2.0)
        sut.operands.enqueue(3.0)
        sut.operaters.enqueue(Operator.subtract)
        sut.operaters.enqueue(Operator.multiply)
        sut.operaters.enqueue(Operator.add)
        sut.operaters.enqueue(Operator.divide)
        let expectation = (((1.0 - 3.0) * 4.0) + 2.0) / 3.0
        // when
        let result = sut.result()
        // then
        XCTAssertEqual(result, expectation)
    }
}
