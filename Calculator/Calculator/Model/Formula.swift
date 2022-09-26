//
//  Formula.swift
//  Created by 미니.
//

import Foundation

struct Formula {
    private let operands: CalculatorItemQueue<Double>
    private let operators: CalculatorItemQueue<Operator>
    
    init(operands: [Double] = [], operators: [Operator] = []) {
        self.operands = CalculatorItemQueue(elements: operands)
        self.operators = CalculatorItemQueue(elements: operators)
    }
    
    func result() -> Double? {
        var operands = operands, operators = operators
        
        guard var calResult: Double = operands.dequeue() else {
            return nil
        }
        
        while !operands.isEmpty {
            let rhs = operands.dequeue()
            let firstOperator = operators.dequeue()
            
            guard let firstOperator = firstOperator,
                  let rhs = rhs else {
                break
            }
            
            do {
                calResult = try firstOperator.calculate(lhs: calResult, rhs: rhs)
            } catch {
                return nil
            }
        }
        
        return calResult
    }
}
