//
//  Formula.swift
//  Calculator
//
//  Created by Kay on 2022/05/20.
//

struct Formula {
    private(set) var operands: CalculatorItemQueue<Double>
    private(set) var operators: CalculatorItemQueue<Operator>

    mutating func result() throws -> Double {
        var calculationResult: Double
        guard let operand = operands.dequeue()  else { throw valueError.operandEmpty }
        calculationResult = operand
        while operators.count != 0 {
            guard let currentOperator = operators.dequeue() else { throw valueError.operatorEmpty }
            guard let currentOperand = operands.dequeue() else { throw valueError.operandEmpty }
            calculationResult = try currentOperator.calculate(lhs: calculationResult, rhs: currentOperand)
        }
        return calculationResult
    }
}
