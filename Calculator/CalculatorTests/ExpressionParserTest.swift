//  CalculatorItemQueueTests - ExpressionParserTest.swift
//  created by vetto on 2023/01/28

import XCTest
@testable import Calculator

extension Formula: Equatable {
    public static func == (lhs: Calculator.Formula, rhs: Calculator.Formula) -> Bool {
        var operatorsHead = lhs.operators.calculatorList.head
        
        while operatorsHead != nil {
            let lhsData = lhs.operands.calculatorList.head?.data
            let rhsData = rhs.operands.calculatorList.head?.data
            
            if lhsData != rhsData {
                return false
            }
            
            operatorsHead = operatorsHead?.next
        }
        
        var operandsHead = lhs.operands.calculatorList.head
        
        while operandsHead != nil {
            let lhsData = lhs.operands.calculatorList.head?.data
            let rhsData = rhs.operands.calculatorList.head?.data
            
            if lhsData != rhsData {
                return false
            }
            
            operandsHead = operandsHead?.next
        }
        
        return true
    }
}

final class ExpressionParserTests: XCTestCase {
    // MARK: - parse method test
    func test_test코드_parse호출후_나온_formula랑_임시로_만든_formula랑_같다() {
        // given
        let testString = "1+2+3−-3*49/7"
        let operands = CalculatorItemQueue<Double>(with: [1, 2, 3, -3, 49, 7])
        let operators = CalculatorItemQueue<Operator>(with: [.add, .add, .subtract, .multiply, .divide])
        
        // when
        let result = ExpressionParser.parse(from: testString)
        let expectation = Formula(operands: operands,
                                  operators: operators)
        
        // then
        XCTAssertEqual(result, expectation)
    }
}
