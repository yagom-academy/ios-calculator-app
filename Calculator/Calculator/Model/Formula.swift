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
        
        guard let firstOperand = operands.dequeue() else {
            return .zero
        }
        result = firstOperand
        while !operands.isEmpty {
            guard let nextOperand = operands.dequeue() else {
                return .zero
            }
            guard let operatorType = operators.dequeue() else {
                return nil
            }
            do {
                result = try operatorType.calculate(lhs: result, rhs: nextOperand)
            } catch CalculatorError.divideError {
                return .nan
            } catch {
            }
        }
        
        return result
    }
    
}
