//
//  Formula.swift
//  Calculator
//
//  Created by 이경민 on 2022/09/22.
//

struct Formula {
    private var operands = CalculatorItemQueue<Double>()
    private var operators = CalculatorItemQueue<Operator>()
    
    mutating func setUpOperands(operands: [Double]) {
        self.operands = CalculatorItemQueue(elements: operands)
    }
    
    mutating func setUpOperators(operators: [Operator]) {
        self.operators = CalculatorItemQueue(elements: operators)
    }
    
    func result() throws -> Double {
        var operands = operands, operators = operators
        
        guard var calResult: Double = operands.dequeue() else {
            return 0
        }
        
        while !(operators.isEmpty && operands.isEmpty) {
            let firstOperand = operands.dequeue() ?? calResult
            let firstOperator = operators.dequeue()
            
            guard let firstOperator = firstOperator else {
                break
            }
            
            do {
                calResult = try firstOperator.calculate(lhs: calResult, rhs: firstOperand)
            } catch {
                throw error
            }
        }
        
        return calResult
    }
}
