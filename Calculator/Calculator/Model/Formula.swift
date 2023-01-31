//
//  Formula.swift
//  Calculator
//
//  Created by jiye Yi on 2023/01/27.
//

struct Formula {
    private(set) var operands: CalculatorItemQueue<Double>
    private(set) var operators: CalculatorItemQueue<Operator>

    mutating func result() -> Double? {
  
        guard var result = operands.dequeue() else {
            return .zero
        }
        
        while let nextOperand = operands.dequeue() {
            guard let operatorType = operators.dequeue() else {
                return nil
            }
            
            do {
                result = try operatorType.calculate(lhs: result, rhs: nextOperand)
            } catch CalculatorError.divideByZero {
                return .nan
            } catch {
                return nil
            }
        }
        
        return result
    }
    
}
