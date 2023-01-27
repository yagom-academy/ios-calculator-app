//  Calculator - Formula.swift
//  created by vetto on 2023/01/27

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        var result: Double = 0
        
        if let firstOperand = operands.dequeue() {
            result = firstOperand
        }
        
        while !operands.isEmpty {
            guard let operand = operands.dequeue(),
                  let `operator` = operators.dequeue() else { return result }
            
            let operateResult = `operator`.calculate(lhs: result, rhs: operand)
            
            result = operateResult
        }
        
        return result
    }
}
