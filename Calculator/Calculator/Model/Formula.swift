//
//  Formula.swift
//  Calculator
//
//  Created by junho lee on 2022/09/23.
//

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue()
    
    mutating func result() -> Result<Double?, CalculateError> {
        var result: Double?
        while !operators.isEmpty {
            let leftHandSide: Double?
            if let result = result {
                leftHandSide = result
            } else {
                leftHandSide = operands.dequeue()
            }
            guard let lhs: Double = leftHandSide,
                  let rhs: Double = operands.dequeue() else {
                return .success(result)
            }
            do {
                result = try operators.dequeue()?.calculate(lhs: lhs, rhs: rhs)
            } catch CalculateError.dividedByZero {
                return .failure(.dividedByZero)
            } catch {
                return .failure(.unexpectedError)
            }
        }
        return .success(result)
    }
}
