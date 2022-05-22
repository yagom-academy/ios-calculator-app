//
//  Formula.swift
//  Calculator
//
//  Created by dhoney96 on 2022/05/20.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<String>
    
    mutating func result() -> Double {
        guard !operands.items.isEmpty,
              !operators.items.isEmpty,
              operands.items.count > operators.items.count,
              var total = operands.dequeue() else
        {
            return 0.0
        }
        
        for _ in 1...operators.items.count {
            guard let number = operands.dequeue() else { return 0.0 }
            
            let symbol = operators.dequeue()
            
            switch symbol {
            case "+":
                total = Operator.add.calculate(lhs: total, rhs: number)
            case "-":
                total = Operator.subtract.calculate(lhs: total, rhs: number)
            case "/":
                total = Operator.divide.calculate(lhs: total, rhs: number)
            case "*":
                total = Operator.multiply.calculate(lhs: total, rhs: number)
            default:
                break
            }
        }
        return total
    }
}
