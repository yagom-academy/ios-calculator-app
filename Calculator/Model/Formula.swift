//
//  Formula.swift
//  Calculator
//
//  Created by unchain123 on 2022/05/19.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue = CalculatorItemQueue<Double>()
    
    var operators: CalculatorItemQueue = CalculatorItemQueue<Character>()
    
    func result() -> Double {
        var result: Double
        
        guard let firstValue = operands.deQueue() else {
            return 0.0
        }
        result = firstValue
        
        while operands.linkedList.head != nil {
            guard let operateValue = operands.deQueue() else {
                return 0.0
            }
            
            guard let operateItem = operators.deQueue() else {
                return 0.0
            }
            
            guard let choiceOpertaion: Operator = Operator.init(rawValue: operateItem) else {
                return 0.0
            }
            result = choiceOpertaion.calculate(lhs: result, rhs: operateValue)
        }
        return result
    }
}
