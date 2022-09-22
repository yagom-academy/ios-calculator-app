//
//  Formula.swift
//  Calculator
//
//  Created by 써니쿠키 on 2022/09/22.
//

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue()
    
    mutating func result() throws -> Double {
        var result: Double = 0.0
        
        while operands.isEmpty() == false {
            guard let operatorCase: Operator = self.operators.dequeue()?.data,
                  let operand: Double = self.operands.dequeue()?.data else {
                throw CalculatorError.otherError
            }
            
            result = try Operator.calculate(operatorCase)(lhs: result, rhs: operand)
        }
        
        return result
    }
}
