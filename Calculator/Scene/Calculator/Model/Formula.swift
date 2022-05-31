//
//  Formula.swift
//  Calculator
//
//  Created by 본프, 수꿍 on 2022/05/20.
//

struct Formula {
    private var operands: CalculatorItemQueue<Double>
    private var operators: CalculatorItemQueue<Operator>

    mutating func result() throws -> Double {
        try checkLackOfItems()
        
        let result = try calculateResult()
        
        return result
    }
    
    private func checkLackOfItems() throws {
        guard operands.queue.isEmpty == false || operators.queue.isEmpty == false else {
            throw CalculatorError.emptyQueues
        }

        guard operands.queue.isEmpty == false else {
            throw CalculatorError.notEnoughOperands
        }

        guard operators.queue.isEmpty == false else {
            throw CalculatorError.notEnoughOperators
        }
        
        guard operands.queue.count - 1 == operators.queue.count else {
            throw CalculatorError.notEnoughOperatorsAndOperands
        }
    }
    
    private mutating func calculateResult() throws -> Double {
        guard var result = operands.queue.dequeue() else {
            throw CalculatorError.notEnoughOperands
        }

        while operators.queue.isEmpty == false {
            guard let operand = operands.queue.dequeue() else {
                throw CalculatorError.notEnoughOperands
            }

            guard let `operator` = operators.queue.dequeue() else {
                throw CalculatorError.notEnoughOperators
            }

            result = try `operator`.calculate(lhs: result, rhs: operand)
        }
        return result
    }

    init(operand: CalculatorItemQueue<Double>, `operator`: CalculatorItemQueue<Operator>) {
        self.operands = operand
        self.operators = `operator`
    }
}
