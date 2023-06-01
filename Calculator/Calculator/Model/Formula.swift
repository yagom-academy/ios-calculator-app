//
//  Formula.swift
//  Calculator
//
//  Created by Minsup on 2023/05/31.
//

struct Formula {
    private(set) var operands: CalculatorItemQueue<Double>
    private(set) var operators: CalculatorItemQueue<Operator>
    
    init(operands: [Double] = [], operators: [Operator] = []) {
        self.operands = CalculatorItemQueue<Double>(operands)
        self.operators = CalculatorItemQueue<Operator>(operators)
    }
    
    mutating func result() throws -> Double {
        
        guard let lhs = operands.dequeue() else { throw CalculationError.notFoundOperand }
        guard let rhs = operands.dequeue() else { throw CalculationError.notFoundOperand }
        guard let `operator` = operators.dequeue() else { throw CalculationError.notFoundOperator }
        
        var result = try `operator`.calculate(lhs: lhs, rhs: rhs)
        
        while !operators.isEmpty {
            guard let next = operands.dequeue() else { throw CalculationError.notFoundOperand }
            guard let `operator` = operators.dequeue() else { throw CalculationError.notFoundOperator }
            result = try `operator`.calculate(lhs: result, rhs: next)
        }
        
        return result
    }
}
