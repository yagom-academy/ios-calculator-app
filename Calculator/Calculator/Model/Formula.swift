//
//  Formula.swift
//  Calculator
//
//  Created by 이경민 on 2022/09/22.
//

import Foundation

struct Formula {
    private var operands = CalculatorItemQueue<Double>()
    private var operators = CalculatorItemQueue<Operator>()
    
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
