//
//  Formula.swift
//  Calculator
//
//  Created by kokkilE on 2023/01/27.
//

struct Formula<T: CalculateItem> {
    var operands = CalculatorItemQueue<T>()
    var operators = CalculatorItemQueue<T>()
    
    mutating func result() -> Double {
        
        guard let firstData = operands.dequeueCalculateItems()?.data as? String,
              var result = Double(firstData) else {
            return 0.0
        }
        
        while let dequeuedOperand = operands.dequeueCalculateItems()?.data as? String,
              let operandData = Double(dequeuedOperand),
              let dequeuedOperator = operators.dequeueCalculateItems()?.data as? String,
              let operatorData = dequeuedOperator.first {

            let operatorInstance = Operator(rawValue: operatorData)
            do {
                result = try operatorInstance!.calculate(lhs: result, rhs: operandData)
            } catch {

            }
        }

        return result
    }
}
