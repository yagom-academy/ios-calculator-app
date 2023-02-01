//
//  Formula.swift
//  Calculator
//
//  Created by kokkilE on 2023/01/27.
//

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    
    mutating func result() -> Double {
        guard var result = operands.dequeueCalculateItems()?.data else {
            return 0
        }
        
        while let dequeuedOperand = operands.dequeueCalculateItems()?.data,
              let dequeuedOperator = operators.dequeueCalculateItems()?.data {
            do {
                result = try dequeuedOperator.calculate(lhs: result, rhs: dequeuedOperand)
            } catch {
                result = Double.nan
            }
        }

        return result
    }
}
