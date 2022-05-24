//
//  Formula.swift
//  Calculator
//
//  Created by 이은찬 on 2022/05/20.
//

import Darwin

struct Formula {
    private var operands = Queue<Double>()
    private var operators = Queue<Operator>()
    
    init(operands: [Double], operators: [Operator]) {
        operands.forEach { operand in
            self.operands.enqueue(Double(operand))
        }
        
        operators.forEach { `operator` in
            self.operators.enqueue(`operator`)
        }
    }
    
    func result() throws -> Double {
        guard operands.count == `operators`.count + 1 else { throw DevideError.insufficientOperator }
        guard let operand = operands.dequeue() else { throw DevideError.nilOfValue }
        var lhs: Double = operand
        while operands.isEmpty == false {
            guard let operand = operands.dequeue() else { throw DevideError.nilOfValue }
            let rhs = operand
            if operators.isEmpty == false {
                let `operator` = operators.dequeue()
                guard let result = try `operator`?.calculate(lhs: lhs, rhs: rhs) else { throw DevideError.nilOfValue }
                lhs = result
            }            
        }
        let temp = lhs * 100000000000000000000
        let result = round(temp) / 100000000000000000000
        return result
    }
}
