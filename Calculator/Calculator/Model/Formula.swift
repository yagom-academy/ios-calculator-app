//
//  Formula.swift
//  Calculator
//
//  Created by 임지성 on 2021/11/11.
//

import Foundation

struct Formula {
    var operators: CalculatorItemQueue<Operator>
    var operands: CalculatorItemQueue<Double>
    
    init(operators: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>(), operands: CalculatorItemQueue<Double> = CalculatorItemQueue<Double>()) {
        self.operators = operators
        self.operands = operands
    }
    
    mutating func result() -> Double {
        var result = 0.0
        let operand = operands.dequeue()
        
        guard var operandSlice = operand else {
            return 1.0
        }
        
        repeat {
            let `operator` = operators.dequeue()
            guard let operatorCase = `operator` else {
                return 0.0
            }
            
            Operator.allCases.forEach { op in
                if operatorCase == op {
                    result = 0.0
                    result += operatorCase.calculate(lhs: operandSlice , rhs: operands.dequeue()!)
                    operandSlice = result
                }
            }
        } while operators.isEmpty == false
        return result
    }
}

