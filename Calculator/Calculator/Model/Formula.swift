//
//  Formula.swift
//  Calculator
//
//  Created by bard, hugh on 2022/05/30.
//

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    
    mutating func result() throws -> Double {
        guard operands.enQueueStack.count == operators.enQueueStack.count + 1 else {
            throw QueueError.unknown
        }
        var optionalTotal: Double?
        
        do {
            optionalTotal = try operands.deQueue()
        } catch {
            throw QueueError.wrongOperands
        }
        
        guard var total = optionalTotal else { throw QueueError.unknown }
        
        for _ in 0..<operators.enQueueStack.count {
            var number: Double?
            var symbol: Operator?
            
            do {
                number = try operands.deQueue()
            } catch {
                throw QueueError.wrongOperands
            }
            
            do {
                symbol = try operators.deQueue()
            } catch {
                throw QueueError.wrongOperators
            }
            
            if symbol == .divide && number == 0.0 {
                throw OperatorError.devideFail
            }
            
            guard let unwrappedNumber = number else { throw QueueError.wrongOperands }
            guard let unwrappedSymbol = symbol else { throw QueueError.wrongOperators }
            total = try unwrappedSymbol.calculate(lhs: total, rhs: unwrappedNumber)
        }
        return total
    }
}
