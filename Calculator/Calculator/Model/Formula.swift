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
        guard var result = operands.deQueue() else { return 0.0 }
        
        while let operand = operands.deQueue(), let operation = operators.deQueue() {
            result = try operation.calculate(lhs: result, rhs: operand)
        }
        
        return result
    }
}

extension Double: CalculatorItem { }
