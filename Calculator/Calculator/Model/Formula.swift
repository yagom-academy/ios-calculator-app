//
//  Formula.swift
//  Calculator
//
//  Created by Kiwi on 2022/05/20.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Character>
    
    mutating func result() throws -> Double {
        guard operands.count > 1 && operators.count >= 1 else { throw CalculatorError.notEnoughInput }
        var result = try Operator(rawValue: operators.dequeue())?
            .calculate(lhs: operands.dequeue(), rhs: operands.dequeue())
        
        while operands.isEmpty == false && operators.isEmpty == false {
            result = try Operator(rawValue: operators.dequeue())?
                .calculate(lhs: result ?? 0.0, rhs: operands.dequeue())
        }
        return result ?? 0.0
    }
}
