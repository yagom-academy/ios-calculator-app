//
//  Formula.swift
//  Calculator
//
//  Created by 이차민 on 2021/11/11.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    func result() -> Double {
        guard operands.items.count > 1 && operators.items.count > 0 else {
            return operands.items.first?.value ?? 0.0
        }
        
        var calculationResult: Double = 0.0
        
        guard let firstOperand = operands.dequeue() else {
            return 0.0
        }
        
        guard let secondOperand = operands.dequeue() else {
            return 0.0
        }
        
        guard let arithmetic = operators.dequeue() else {
            return 0.0
        }
            
        let currentCalculationResult = arithmetic.calculate(lhs: firstOperand, rhs: secondOperand)
    
        if currentCalculationResult.isNaN {
            return .nan
        }
        
        calculationResult += currentCalculationResult
        
        guard operands.items.count > 0 && operators.items.count > 0 else {
            return calculationResult
        }
        
        while operands.items.count > 0 && operators.items.count > 0 {
            guard let nextOperand = operands.dequeue() else {
                return 0.0
            }
            
            guard let nextArithmetic = operators.dequeue() else {
                return 0.0
            }
            
            let nextCalculationResult = nextArithmetic.calculate(lhs: calculationResult, rhs: nextOperand)
            
            if nextCalculationResult.isNaN {
                return .nan
            }
            
            calculationResult = nextCalculationResult
        }
        
        return calculationResult
    }
}

