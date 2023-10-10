//
//  Formula.swift
//  Calculator
//
//  Created by jyubong on 10/10/23.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    func result() throws -> Double {
        guard var previousOperand = operands.deQueue() else { return 0.0 }
        
        while let operand = operands.deQueue(), let `operator` = operators.deQueue() {
            previousOperand = try `operator`.calculate(lhs: previousOperand, rhs: operand)
        }
        
        return previousOperand
    }
}

extension Double: CalculatorItem { }
