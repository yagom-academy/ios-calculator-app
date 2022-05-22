//
//  Formula.swift
//  Calculator
//
//  Created by dhoney96 on 2022/05/20.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<String>
    
    mutating func result() throws -> Double {
        guard !operands.items.isEmpty,
              !operators.items.isEmpty,
              operands.items.count > operators.items.count,
              var total = operands.dequeue() else
        {
            throw CalculatorError.emptyError
        }
        
        for _ in 1...operators.items.count {
            guard let number = operands.dequeue() else { throw CalculatorError.emptyError }
            
            let symbol = operators.dequeue()
            
            switch symbol {
            case "+":
                total = try Operator.add.calculate(lhs: total, rhs: number)
            case "-":
                total = try Operator.subtract.calculate(lhs: total, rhs: number)
            case "/":
                total = try Operator.divide.calculate(lhs: total, rhs: number)
            case "*":
                total = try Operator.multiply.calculate(lhs: total, rhs: number)
            default:
                break
            }
        }
        return total
    }
}
