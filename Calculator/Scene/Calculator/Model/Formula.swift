//
//  Formula.swift
//  Calculator
//
//  Created by 본프, 수꿍 on 2022/05/20.
//

struct Formula {
    private var operands: CalculatorItemQueue<Double> = CalculatorItemQueue<Double>()
    private var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>()

    mutating func result() throws -> Double {
        guard try checkCalculatorItems() else {
            throw CalculatorError.lackOfInput
        }
        
        let result = try calculateResult()
        
        return result
    }
    
    private func checkCalculatorItems() throws -> Bool {
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
        
        return true
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

    init(operand: [Double], `operator`: [Operator]) {
        operand.forEach { self.operands.queue.enqueue($0) }
        `operator`.forEach { self.operators.queue.enqueue($0) }
    }
}
