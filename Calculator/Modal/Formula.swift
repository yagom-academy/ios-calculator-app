//
//  Formula.swift
//  Calculator
//
//  Created by 우롱차 on 2022/03/18.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue
    var operators: CalculatorItemQueue
    
    func result() -> Double? {
        
        var result = operands.dequeue() as? Double
       
        while (self.operands.isEmpty() == false) || (self.operators.isEmpty() == false){
            guard let operators = operators.dequeue() as? Operator,
                 let doubleOperands = operands.dequeue() as? Double
                  else {
                return nil
            }
            result = operators.calculate(lhs: result, rhs: doubleOperands)
        }
        return result
    }
}
