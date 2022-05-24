//
//  Formula.swift
//  Calculator
//
//  Created by 이은찬 on 2022/05/20.
//

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
        var lhs: Double = 0.0
        while operands.isEmpty == false {
            if lhs == 0.0 {
                lhs = operands.dequeue() ?? 0.0
            }
            let rhs = operands.dequeue() ?? 0.0
            if operators.isEmpty == false {
                let `operator` = operators.dequeue()
                lhs = ( try `operator`?.calculate(lhs: lhs, rhs: rhs)) ?? 0.0
            }            
        }
        return lhs
    }
}
