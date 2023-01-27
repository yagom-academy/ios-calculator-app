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
        
        while !operands.isEmpty && !operators.isEmpty {
            guard let rhs = operands.dequeue(),
                  let `operator` = operators.dequeue() else { return result }
            
            let lhs = result
            let operateResult = `operator`.calculate(lhs: lhs, rhs: rhs)
            
            result += operateResult
        }
        
        return result
    }
}
