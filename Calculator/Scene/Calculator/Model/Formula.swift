//
//  Formula.swift
//  Calculator
//
//  Created by 이은찬 on 2022/05/20.
//

struct Formula {
    var operands = Queue<Double>()
    var operators = Queue<Operator>()
    
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
