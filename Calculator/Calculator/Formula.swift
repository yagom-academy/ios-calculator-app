//
//  Formula.swift
//  Calculator
//
//  Created by 정선아 on 2022/09/23.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Character>
    
    enum FormulaError: Error {
        case emptyOperandsQueue
        case emptyOperatorsQueue
    }
    
    mutating func result() throws -> Double {
        guard var result: Double = operands.deQueue() else {
            throw FormulaError.emptyOperandsQueue
        }
        
        while operators.isEmpty() == false {
            guard let inputOperator = operators.deQueue() else {
                throw FormulaError.emptyOperatorsQueue
            }
            
            guard let inputOperands = operands.deQueue() else {
                throw FormulaError.emptyOperandsQueue
            }
            
            let eachOperator = Operator(rawValue: inputOperator)
            result = (eachOperator?.calculate(lhs: result, rhs: inputOperands)) ?? 0
        }
        
        return result
    }
}
