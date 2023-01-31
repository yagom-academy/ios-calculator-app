//  ExpressionParserTest.swift
//  Created by 레옹아범 on 2023/01/27.

import XCTest
@testable import Calculator

extension Formula: Equatable {
    public static func == (lhs: Calculator.Formula, rhs: Calculator.Formula) -> Bool {
        var firstFormula = lhs
        var secondFormula = rhs
        
        return firstFormula.result() == secondFormula.result()
    }
}

final class ExpressionParserTest: XCTestCase {
    func test_1더하기2의_문자열이_parse인자로_들어갈경우_operands가1_2와_operator가_add인_Formula를_반환한다() {
        // given
        let operands: [Double] = [1, 2]
        let operators: [Operator] = [.add]
        let inputs = "1 + 2"
        
        let exception = Formula(operands: CalculatorItemQueue(elements: operands), operators: CalculatorItemQueue(elements: operators))
        
        // when
        let result = ExpressionParser.parse(from: inputs)
        
        // then
        XCTAssertEqual(result, exception)
    }
    
    func test_1더하기2곱하기3빼기1의_문자열이_parse인자로_들어갈경우_operands1_2_3_1과_operator가_add_multiply_subtract의_Formula를_반환한다() {
        // given
        let operands: [Double] = [1, 2, 3, 1]
        let operators: [Operator] = [.add, .multiply, .subtract]
        let inputs = "1 + 2 * 3 - 1"
        
        let exception = Formula(operands: CalculatorItemQueue(elements: operands), operators: CalculatorItemQueue(elements: operators))
        
        // when
        let result = ExpressionParser.parse(from: inputs)
        
        // then
        XCTAssertEqual(result, exception)
    }
    
    func test_1빼기음수1의_문자열이_parse인자로_들어갈경우_operands1_음수1과_operator가_subtract인_Formula를_반환한다() {
        // given
        let operands: [Double] = [1, -1]
        let operators: [Operator] = [.subtract]
        let inputs = "1 - -1"
        
        let exception = Formula(operands: CalculatorItemQueue(elements: operands), operators: CalculatorItemQueue(elements: operators))
        
        // when
        let result = ExpressionParser.parse(from: inputs)
        
        // then
        XCTAssertEqual(result, exception)
    }
}
