//
//  Formula.swift
//  Calculator
//
//  Created by 전민수 on 2022/05/19.
//
struct Formula {
    private var operands: CalculatorItemQueue<Double>
    private var operators: CalculatorItemQueue<String>
    
    mutating func result() throws -> Double {
        guard operands.queue.isEmpty == false || operators.queue.isEmpty == false else {
            throw CalculatorError.emptyQueues
        }
        
        guard operands.queue.isEmpty == false else {
            throw CalculatorError.notEnoughOperands
        }
        
        guard operators.queue.isEmpty == false else {
            throw CalculatorError.notEnoughOperators
        }
        
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
            
            guard let operatorCase = Operator(rawValue: Character(`operator`)) else {
                throw CalculatorError.invalidOperator
            }
            
            result = try operatorCase.calculate(lhs: result, rhs: operand)
        }
        
        return result
    }
    
    init(operands: CalculatorItemQueue<Double>, operators: CalculatorItemQueue<String>) {
        self.operands = operands
        self.operators = operators
    }
}


