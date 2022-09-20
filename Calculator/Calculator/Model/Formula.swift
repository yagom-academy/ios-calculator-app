//
//  Formula.swift
//  Calculator
//
//  Created by leewonseok on 2022/09/20.
//

import Foundation

struct Formula {
    var operands = CalculatorItemQueue()
    var operators = CalculatorItemQueue()
    
    public mutating func result() throws -> Double {
        guard var totalNumber = operands.dequeue() as? Double else { throw CalculatorError.emptyError }

        for _ in 1...operands.count {
            guard let number = self.operands.dequeue() as? Double else { throw CalculatorError.emptyError }
            guard let operatorSymbol = self.operators.dequeue() as? Operator else { throw CalculatorError.emptyError }
            
            if operatorSymbol == Operator.divide && number == 0.0 { throw CalculatorError.divideError }
            
            totalNumber = operatorSymbol.calculate(lhs: totalNumber, rhs: number)
        }
        return totalNumber
    }
}
