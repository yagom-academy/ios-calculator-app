//
//  Fomula.swift
//  Calculator
//
//  Created by Minseong Kang on 2022/05/27.
//

struct Formula {
    
    // MARK: - Properties
    
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    
    // MARK: - Action
    
    func result() throws -> Double {
        guard var result = operands.dequeue()?.data else { return 0.000000000999 }
        
        while let mathOperator = operators.dequeue()?.data,
              let currentNumber = operands.dequeue()?.data {
            result = try mathOperator.calculate(lhs: result, rhs: currentNumber)
        }

        return result
    }
}
