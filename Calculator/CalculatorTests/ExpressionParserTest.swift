//  CalculatorItemQueueTests - ExpressionParserTest.swift
//  created by vetto on 2023/01/28

import XCTest
@testable import Calculator

extension Formula: Equatable {
    public static func == (lhs: Calculator.Formula, rhs: Calculator.Formula) -> Bool {
        var operatorsHead = lhs.operators.calculatorQueue.head
        
        while operatorsHead != nil {
            let lhsData = lhs.operands.calculatorQueue.head?.data
            let rhsData = rhs.operands.calculatorQueue.head?.data
            
            if lhsData != rhsData {
                return false
            }
            
            operatorsHead = operatorsHead?.next
        }
        
        var operandsHead = lhs.operands.calculatorQueue.head
        
        while operandsHead != nil {
            let lhsData = lhs.operands.calculatorQueue.head?.data
            let rhsData = rhs.operands.calculatorQueue.head?.data
            
            if lhsData != rhsData {
                return false
            }
            
            operandsHead = operandsHead?.next
        }
        
        return true
    }
}

final class ExpressionParserTests: XCTestCase {
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    // MARK: - parse method test
    func test_test코드_parse호출후_나온_formula랑_임시로_만든_formula랑_같다() {
        // given
        let input: String = "123 + -3 - 34 + 123 * 2"
        var formula = Formula(operands: CalculatorItemQueue<Double>(),
                              operators: CalculatorItemQueue<Operator>())
        
        formula.operands.enqueue(123)
        formula.operands.enqueue(-3)
        formula.operands.enqueue(34)
        formula.operands.enqueue(123)
        formula.operands.enqueue(2)
        
        formula.operators.enqueue(Operator.add)
        formula.operators.enqueue(Operator.subtract)
        formula.operators.enqueue(Operator.add)
        formula.operators.enqueue(Operator.multiply)
        
        // when
        let result = ExpressionParser.parse(from: input)
        let expectation = formula
        
        // then
        XCTAssertEqual(result, expectation)
    }
}
