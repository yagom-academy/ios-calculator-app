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
    }
}
