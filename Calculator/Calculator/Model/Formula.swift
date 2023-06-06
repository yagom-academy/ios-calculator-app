//
//  Formula.swift
//  Calculator
//
//  Created by Daehoon Lee on 2023/06/06.
//

struct Formula<Operand: CalculateItem, Operator: CalculateItem> {
    var operands: CalculatorItemQueue<Operand>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        guard operands.isEmpty else { return 0 }
        guard let result = operands.dequeue() as? Double else { return 0 }
        
        return result
    }
}
