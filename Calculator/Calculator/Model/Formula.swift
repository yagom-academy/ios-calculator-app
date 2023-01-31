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
  
        guard var firstOperand = operands.dequeue() else {
            return .zero
        }
        var result: Double = firstOperand
        
        while let nextOperand = operands.dequeue() {
            guard let operatorType = operators.dequeue() else {
                return nil
            }
            
            do {
                result = try operatorType.calculate(lhs: result, rhs: nextOperand)
            } catch CalculatorError.divideByZeroError {
                return .nan
            } catch {
                print(error)
            }
        }
        
        return result
    }
    
}
