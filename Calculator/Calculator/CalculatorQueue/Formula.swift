//
//  Formula.swift
//  Calculator
//
//  Created by 유한석 on 2022/05/19.
//
struct Formula {
    var operands: CalculatorItemQueue
    var operators: CalculatorItemQueue
    
    mutating func result() -> Double {
        guard var lhs: Double = operands.deQueue()?.value as? Double else {
            return 0.0
        }
        while true {
            guard operators.count > 0 , operands.count > 0 else {
                break
            }
            guard let calcOperators = operators.deQueue()?.value as? Operator else {
                return lhs
            }
            guard let rhs = operands.deQueue()?.value as? Double else {
                return lhs
            }
            do {
                try lhs = calcOperators.calculate(lhs: lhs, rhs: rhs)
            } catch CalculatorError.divideByZero {
                debugPrint("CalculatorError.divideByZero")
            } catch {
                debugPrint("Unknown Error")
            }
        }
        return lhs
    }
}




