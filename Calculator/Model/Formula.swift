//
//  Formula.swift
//  Calculator
//
//  Created by unchain123 on 2022/05/19.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue = CalculatorItemQueue<Double>()
    
    var operators: CalculatorItemQueue = CalculatorItemQueue<Operator>()
    
    func result() throws -> Double {
        var result: Double
        
        guard let firstValue = operands.deQueue() else {
            throw CalculationError.noneValue
        }
        result = firstValue
        
        while operands.linkedList.head != nil {
            guard let operateValue = operands.deQueue() else {
                throw CalculationError.noneValue
            }
            
            guard let operateItem = operators.deQueue() else {
                throw CalculationError.noneValue
            }
            do {
                try result = operateItem.calculate(lhs: result, rhs: operateValue)
            } catch CalculationError.divideByZero {
                return .nan
            }
        }
        return result
    }
}
