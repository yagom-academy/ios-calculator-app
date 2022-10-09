//
//  FormulaTests.swift
//  Created by 미니.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    func test_피연산자가_연산자보다_1개_많은_경우_연산을_정상수행하는지() {
        // given
        let operandValues: [Double] = [10, 9, 8, 7, 6]
        var operands = CalculatorItemQueue<Double>()
        operandValues.forEach { operands.enqueue($0) }
        
        let operatorValues: [Operator] = [.add, .divide, .multiply, .subtract]
        var operators = CalculatorItemQueue<Operator>()
        operatorValues.forEach { operators.enqueue($0) }
        
        var sut = Formula(operands: operands, operators: operators)

        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, 10.625)
    }

    func test_피연산자가_연산자보다_2개_이상_많은_경우_연산수행결과가_예측값과_동일한가() {
        // given
        let operandValues: [Double] = [10, 9, 8, 7, 6, 5]
        var operands = CalculatorItemQueue<Double>()
        operandValues.forEach { operands.enqueue($0) }
        
        let operatorValues: [Operator] = [.add, .divide, .multiply, .subtract]
        var operators = CalculatorItemQueue<Operator>()
        operatorValues.forEach { operators.enqueue($0) }
        
        var sut = Formula(operands: operands, operators: operators)
        
        // when
        let result = sut.result()

        // then
        XCTAssertEqual(result, 10.625)

    }

    func test_연산자가_피연산자와_개수가_동일한_경우_연산수행결과가_예측치와_동일한가() {
        // given
        let operandValues: [Double] = [10, 9, 8, 7]
        var operands = CalculatorItemQueue<Double>()
        operandValues.forEach { operands.enqueue($0) }
        
        let operatorValues: [Operator] = [.add, .divide, .multiply, .subtract]
        var operators = CalculatorItemQueue<Operator>()
        operatorValues.forEach { operators.enqueue($0) }
        
        var sut = Formula(operands: operands, operators: operators)
        
        // when
        let result = sut.result()

        // then
        XCTAssertEqual(result, 16.625)
    }

    func test_연산자가_피연산자보다_많은_경우_수행결과가_예측치와_동일한가() {
        // given
        let operandValues: [Double] = [10, 9, 8]
        var operands = CalculatorItemQueue<Double>()
        operandValues.forEach { operands.enqueue($0) }
        
        let operatorValues: [Operator] = [.add, .divide, .multiply, .subtract]
        var operators = CalculatorItemQueue<Operator>()
        operatorValues.forEach { operators.enqueue($0) }
        
        var sut = Formula(operands: operands, operators: operators)
        
        // when
        let result = sut.result()

        // then
        XCTAssertEqual(result, 2.375)
    }

    func test_0으로_나누는_경우_nan을_반환하는가() {
        // given
        let operandValues: [Double] = [10, 9, 0]
        var operands = CalculatorItemQueue<Double>()
        operandValues.forEach { operands.enqueue($0) }
        
        let operatorValues: [Operator] = [.add, .divide, .multiply, .subtract]
        var operators = CalculatorItemQueue<Operator>()
        operatorValues.forEach { operators.enqueue($0) }
        
        var sut = Formula(operands: operands, operators: operators)
        
        // when
        let result = sut.result()

        // then
        XCTAssertTrue(result!.isNaN)
    }

    func test_피연산자가_없는_경우_nil을_반환하는가() {
        // given
        let operandValues: [Double] = []
        var operands = CalculatorItemQueue<Double>()
        operandValues.forEach { operands.enqueue($0) }
        
        let operatorValues: [Operator] = [.add, .divide, .multiply, .subtract]
        var operators = CalculatorItemQueue<Operator>()
        operatorValues.forEach { operators.enqueue($0) }
        
        var sut = Formula(operands: operands, operators: operators)

        // when
        let result = sut.result()
        
        // then
        XCTAssertNil(result)
    }
}
