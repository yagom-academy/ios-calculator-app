//
//  Formula.swift
//  Calculator
//
//  Created by 비모 on 2023/06/05.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        var result: Double = 0.0
        
        if operands.isEmpty {
            return result
        }
        
        if operands.count == 1, let number = operands.dequeue() {
            return number
        }
        
        guard let lhs = operands.dequeue() else {
             return result
        }
        
        result = lhs
        
        while let `operator` = operators.dequeue(), let rhs = operands.dequeue() {
            do {
                result = try `operator`.calculate(lhs: result, rhs: rhs)
            } catch let error as CalculatorError {
                switch error {
                case .divisionError:
                    print(error.message)
                }
            } catch {
                print("알 수 없는 에러 발생")
            }
        }
        
        return result
    }
}
