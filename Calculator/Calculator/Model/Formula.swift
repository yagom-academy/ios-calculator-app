//
//  Formula.swift
//  Calculator
//
//  Created by Erick on 2023/06/01.
///

struct Formula {
    private var operands: CalculatorItemQueue<Double>
    private var operators: CalculatorItemQueue<Operator>
    
    init(operands: CalculatorItemQueue<Double>, operators: CalculatorItemQueue<Operator>) {
        self.operands = operands
        self.operators = operators
    }
    
    mutating func result() -> Double {
        guard var result: Double = operands.dequeue() else { return Double(0) }
        
        while !operators.isEmpty {
            let lhs = result
            guard let rhs: Double = operands.dequeue(),
                  let `operator`: Operator = operators.dequeue() else { return result }
            
            result = `operator`.calculate(lhs: lhs, rhs: rhs)
        }
        
        return result
    }
}
