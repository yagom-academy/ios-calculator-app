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
        
        guard let lhs = operands.dequeue() else { throw CalculationError.notFoundOperand }
        guard let `operator` = operators.dequeue() else { throw CalculationError.notFoundOperator }
        guard let rhs = operands.dequeue() else { throw CalculationError.notFoundOperand }        
        var result = try `operator`.calculate(lhs: lhs, rhs: rhs)
        
        while let next = operands.dequeue() {
            guard let `operator` = operators.dequeue() else { throw CalculationError.notFoundOperator }
            result = try `operator`.calculate(lhs: result, rhs: next)
        }
        
        return result
    }
}
