//
//  Formula.swift
//  Calculator
//
//  Created by Mangdi on 2022/09/22.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>?
    var operators: CalculatorItemQueue<Operator>?
    
    mutating func result() -> Double {
        guard var result = operands?.dequeue() else {
            return 0
        }
        
        while operators?.front != nil,
              let someOperator: Operator = operators?.dequeue(),
              let someOperand: Double = operands?.dequeue() {
            
            switch someOperator {
            case .add:
                result = Operator.add.calculate(lhs: result, rhs: someOperand)
            case .subtract:
                result = Operator.subtract.calculate(lhs: result, rhs: someOperand)
            case .multiply:
                result = Operator.multiply.calculate(lhs: result, rhs: someOperand)
            case .divide:
                result = Operator.divide.calculate(lhs: result, rhs: someOperand)
            }
        }
        
        return result
    }
}
