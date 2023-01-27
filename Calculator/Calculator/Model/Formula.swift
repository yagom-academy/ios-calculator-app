//
//  Formula.swift
//  Calculator
//
//  Created by jiye Yi on 2023/01/27.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>

    
    mutating func result() -> Double? {
        var result: Double = 0
        
        guard var firstOperand = operands.dequeue() else {
            return .zero
        }
        
        while !operands.isEmpty {
            guard let nextOperand = operands.dequeue() else {
                return .zero
            }
            guard let operatorType = operators.dequeue() else {
                return nil
            }
            do {
                result = try operatorType.calculate(lhs: firstOperand, rhs: nextOperand)
                firstOperand = result
            } catch CalculatorError.divideError {
                return .nan
            } catch {
            }
        }
        
        return result
    }
}
