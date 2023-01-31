//
//  Formula.swift
//  Calculator
//
//  Created by 무리 on 2023/01/27.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        print(operands)
        print(operators)
        var result1: Double = 0
        var result2: Double = 0
        
        while operands.isEmpty == false {
            if operands.head == 0 {
                guard let lhsOperand = operands.dequeue() else {
                    return .nan
                }
                guard let operatorSign = operators.dequeue() else {
                    return .nan
                }
                guard let rhsOperand = operands.dequeue() else {
                    return .nan
                }
                
                result1 = operatorSign.calculate(lhs: lhsOperand, rhs: rhsOperand)
            } else {
                var lhsOperand = result1

                guard let operatorSign = operators.dequeue() else {
                    return 0
                }
                guard let rhsOperand = operands.dequeue() else {
                    return .nan
                }
  
                result2 = operatorSign.calculate(lhs: lhsOperand, rhs: rhsOperand)
                result1 = result2
            }
        }
        
        return Double()
    }
}
