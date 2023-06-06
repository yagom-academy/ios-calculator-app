//
//  Formula.swift
//  Calculator
//
//  Created by MARY on 2023/06/03.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() throws -> Double {
        guard operators.size > 0,
              operators.size + 1 == operands.size else {
            throw FormulaErrors.invalidFormula
        }
        guard var resultValue = operands.dequeue() else {
            throw FormulaErrors.noValueInQueue
        }
        
        while operators.isEmpty == false {
            guard let `operator` = operators.dequeue(),
                  let rhs = operands.dequeue() else {
                throw FormulaErrors.noValueInQueue
            }
            
            resultValue = try `operator`.calculate(lhs: resultValue, rhs: rhs)
        }
        
        return resultValue
    }
}
