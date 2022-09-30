//
//  Formula.swift
//  Calculator
//
//  Created by SummerCat on 2022/09/24.
//

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    
    mutating func result() -> Double {
        guard var result = operands.dequeue() else { return 0 }
        
        while !operands.isEmpty && !operators.isEmpty {
            guard let operatorSign = operators.dequeue(),
                  let rhs = operands.dequeue() else { return result }
            
            result = operatorSign.calculate(lhs: result, rhs: rhs)
        }
        
        print(result)
        return result
    }
}
