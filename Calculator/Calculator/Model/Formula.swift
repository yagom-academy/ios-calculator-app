//
//  Formula.swift
//  Calculator
//
//  Created by jyubong,Morgan.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    func result() -> Double {
        guard var lhs = operands.deQueue() else { return .zero }
        
        while let rhs = operands.deQueue(), let `operator` = operators.deQueue() {
            lhs = `operator`.calculate(lhs: lhs, rhs: rhs)
        }
        
        return lhs
    }
}
