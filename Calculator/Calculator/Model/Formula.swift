//
//  Formula.swift
//  Calculator
//
//  Created by Minsup on 2023/05/31.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    init(operands: [Double] = [], operators: [Operator] = []) {
        self.operands = CalculatorItemQueue<Double>(operands)
        self.operators = CalculatorItemQueue<Operator>(operators)
    }
    
    mutating func result() throws -> Double {
        
        guard var result = operands.dequeue() else { throw CalculationError.notFoundOperand }
        
        while !operands.isEmpty {
            guard let `operator` = operators.dequeue() else { throw CalculationError.notFoundOperator }
            guard let next = operands.dequeue() else { throw CalculationError.notFoundOperand }            
            result = `operator`.calculate(lhs: result, rhs: next)
        }
        
        return result
    }
}
