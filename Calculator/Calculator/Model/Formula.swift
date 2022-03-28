//
//  Formula.swift
//  Calculator
//
//  Created by marisol on 2022/03/18.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() throws -> Double {
        var formulaResult = operands.dequeue() ?? 0

        while operands.isEmpty == false {
            guard let number = operands.dequeue(),
                  let operatorData = operators.dequeue()
            else {
                throw CalculatorError.invalidFormula
            }
            
            if number == .zero && operatorData == .division {
                throw CalculatorError.divisionByZero
            }
            
            formulaResult = operatorData.calculate(lhs: formulaResult, rhs: number)
        }
        
        return formulaResult
    }
}
