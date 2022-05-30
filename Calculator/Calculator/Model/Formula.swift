//
//  Formula.swift
//  Calculator
//
//  Created by bard, hugh on 2022/05/30.


struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    
    mutating func result() throws -> Double {
        guard operands.enQueueStack.count == operators.enQueueStack.count + 1 else {
            throw QueueError.unknown
        }
        var total = try operands.deQueue()
        
        for _ in 1...operators.enQueueStack.count {
            let number = try operands.deQueue()
            let symbol = try operators.deQueue()
            
            if symbol == .divide && number == 0.0 {
                throw OperatorError.devideFail
            }
            
            total = try symbol.calculate(lhs: total, rhs: number)
        }
        return total
    }
}