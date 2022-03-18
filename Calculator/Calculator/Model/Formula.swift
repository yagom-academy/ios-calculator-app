//
//  Formula.swift
//  Calculator
//
//  Created by DuDu on 2022/03/18.
//

struct Formula {
    let operands: CalculatorItemQueue<Double>
    let operators: CalculatorItemQueue<Operator>
    
    func result() throws -> Double {
        var formulaResult = operands.dequeue() ?? 0
        
        while operands.isEmpty == false {
            guard let number = operands.dequeue(),
                  let `operator` = operators.dequeue()
            else {
                throw CalculateError.invalidFormula
            }
            
            formulaResult = try `operator`.calculate(lhs: formulaResult, rhs: number)
        }
        
        return formulaResult
    }
}

