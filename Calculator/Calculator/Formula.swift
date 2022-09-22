//
//  Formula.swift
//  Calculator
//
//  Created by Gundy on 2022/09/22.
//

struct Formula {
    var operands: CalculatorItemQueue<Double> = .init()
    var operators: CalculatorItemQueue<Operator> = .init()
    
    mutating func result() throws -> Double {
        while operands.count > 1 {
            guard let lhs = operands.dequeue(),
                  let rhs = operands.dequeue(),
                  let operatorSign = operators.dequeue() else {
                      throw FormulaError.invalidInput
                  }
            let operationResult: Double = operatorSign.calculate(lhs: lhs, rhs: rhs)
            operands.insert(operationResult, at: 0)
        }
        guard let result = operands.peek else {
            throw FormulaError.unexpectedError
        }
        return result
    }
}
