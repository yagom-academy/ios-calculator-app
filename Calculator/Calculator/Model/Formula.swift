//  Calculator - Formula.swift
//  created by vetto on 2023/01/27

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        
        guard var result = operands.dequeue() else { return 0 }
        
        while !operands.isEmpty && !operators.isEmpty {
            guard let operand = operands.dequeue(),
                  let `operator` = operators.dequeue() else { return result }
            
            result = `operator`.calculate(lhs: result, rhs: operand)
        }
        
        return result
    }
}
