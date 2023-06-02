//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by Min Hyun on 2023/06/02.
//

import XCTest
@testable import Calculator


final class ExpressionParserTests: XCTestCase {
    func test_parse_넘겨받은_숫자를_분리하여_연산한_결과가_기대값과_같다() {
        // given
        let input = "12+3−5÷5×2"
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        operands.enqueue(12)
        operands.enqueue(3)
        operands.enqueue(5)
        operands.enqueue(5)
        operands.enqueue(2)
        operators.enqueue(Operator.add)
        operators.enqueue(Operator.subtract)
        operators.enqueue(Operator.divide)
        operators.enqueue(Operator.multiply)
        var testFormula = Formula(operands: operands, operators: operators)
        let expected = try? testFormula.result()
        
        // when
        var formula = ExpressionParser.parse(from: input)
        let result = try? formula.result()

        // then
        XCTAssertEqual(result, expected)
    }
    
    func test_parse_마이너스_부호가_포함한_숫자를_분리하여_연산한_결과가_기대값과_같다() {
        // given
        let input = "12+1−-2÷5×2"
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        operands.enqueue(12)
        operands.enqueue(1)
        operands.enqueue(-2)
        operands.enqueue(5)
        operands.enqueue(2)
        operators.enqueue(Operator.add)
        operators.enqueue(Operator.subtract)
        operators.enqueue(Operator.divide)
        operators.enqueue(Operator.multiply)
        var testFormula = Formula(operands: operands, operators: operators)
        let expected = try? testFormula.result()
        
        // when
        var formula = ExpressionParser.parse(from: input)
        let result = try? formula.result()

        // then
        XCTAssertEqual(result, expected)
    }
    
    func test_parse_리턴타입이_Formula이다() {
        // given
        let input = "1+2"
        let operands = CalculatorItemQueue<Double>()
        let operators = CalculatorItemQueue<Operator>()
        let emptyFormula = Formula(operands: operands, operators: operators)
        
        // when
        let formula = ExpressionParser.parse(from: input)
        
        // then
        XCTAssertTrue(type(of:formula) == type(of:emptyFormula))
    }

}
