//
//  Formula.swift
//  Calculator
//
//  Created by 박병호 on 2021/11/09.
//

import Foundation

struct Formula {
    private var operands: CalculatorItemQueue<Double>
    private var operators: CalculatorItemQueue<Operator>
    
    init(operands: CalculatorItemQueue<Double>, operators: CalculatorItemQueue<Operator>) {
        self.operands = operands
        self.operators = operators
    }
    
    mutating func result() throws -> Double {
        var result = try operands.deQueue()
        
        while operators.isEmpty == false {
            let operatorOfDeQueue = try operators.deQueue()
            
            result = try operatorOfDeQueue.calculate(lhs: result, rhs: try operands.deQueue())
        }
        
        return result
    }
}
