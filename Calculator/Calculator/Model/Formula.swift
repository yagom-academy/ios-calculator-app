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
        guard var result = operands.dequeue() else {
            return 0.0
        }
        
        while let `operator` = operators.dequeue(), let nextOperand = operands.dequeue() {
            do {
                result = try `operator`.calculate(lhs: result, rhs: nextOperand)
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
