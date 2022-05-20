//
//  Formula.swift
//  Calculator
//
//  Created by Kiwi on 2022/05/20.
//

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    
    mutating func result() throws -> Double {
        guard var result = operands.dequeue() else { throw OperatorError.emptyList }
        
        while operands.isEmpty == false {
            if let number = operands.dequeue(),
               let operatorSign = operators.dequeue() {
                result = try operatorSign.calculate(lhs: result, rhs: number)
            } else {
                throw OperatorError.emptyList
            }
        }
        return result
    }
}
