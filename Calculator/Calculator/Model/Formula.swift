//
//  Formula.swift
//  Calculator
//
//  Created by DuDu on 2022/03/18.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    func result() throws -> Double {
        var formulaResult = operands.dequeue() ?? 0
        
        while operands.isEmpty == false {
            guard let number = operands.dequeue(),
                  let op = operators.dequeue()
            else {
                throw CalculateError.invalidFormula
            }
            
            formulaResult = try op.calculate(lhs: formulaResult, rhs: number)
        }
        
        return formulaResult
    }
}

