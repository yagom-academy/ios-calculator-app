//
//  Formula.swift
//  Calculator
//
//  Created by Kiwi on 2022/05/20.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() throws -> Double {
        guard var result = operands.dequeue() else { throw OperatorError.emptyList }
        
        while operands.isEmpty == false {
            guard let number = operands.dequeue(),
                  let operatorSign = operators.dequeue() else { throw OperatorError.emptyList }
            result = try operatorSign.calculate(lhs: result, rhs: number)
        }
        return result
    }
}
