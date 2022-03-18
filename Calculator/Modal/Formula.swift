//
//  Formula.swift
//  Calculator
//
//  Created by 우롱차 on 2022/03/18.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<String>
    var operators: CalculatorItemQueue<Operator>
    
    func result() -> Double {
        
        var result = stringToDouble(operands.dequeue())
        
        while (self.operands.isEmpty() == false) || (self.operators.isEmpty() == false){
            guard let operands = operands.dequeue(), let operators = operators.dequeue() else {
               return 0
            }
            let doubleOperands = stringToDouble(operands)
            result = operators.calculate(lhs: result, rhs: doubleOperands)
        }
        return result
    }
    
    func stringToDouble(_ str:String?) -> Double {
        guard let string = str else {
            return 0
        }
                
        return Double(string) ?? 0
    }
}
