//
//  Formula.swift
//  Created by 미니.
//

import Foundation

struct Formula {
    private let operands: CalculatorItemQueue<Double>
    private let operators: CalculatorItemQueue<Operator>
    
    init(operands: [Double], operators: [Operator]) {
        self.operands = CalculatorItemQueue(elements: operands)
        self.operators = CalculatorItemQueue(elements: operators)
    }
    
    func result() throws -> Double {
        var operands = operands, operators = operators
        
        guard var calculatedValue: Double = operands.dequeue() else {
            throw FormulaError.emptyQueue
        }
        
        while !operands.isEmpty {
            let rhs = operands.dequeue()
            let firstOperator = operators.dequeue()
            
            guard let firstOperator = firstOperator,
                  let rhs = rhs else {
                break
            }
            
            do {
                calculatedValue = try firstOperator.calculate(lhs: calculatedValue, rhs: rhs)
            } catch {
                throw FormulaError.dividedByZero
            }
        }
        
        return calculatedValue
    }
}
