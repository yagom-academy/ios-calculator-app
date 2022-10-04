//
//  Formula.swift
//  Calculator
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    lazy var result: Double = operands.list.head?.value ?? 0
    lazy var currentOperand = operands.list.head
    lazy var currentOperator = operators.list.head
    lazy var count: Int = operators.count
    
    mutating func result(_ count: Int) throws -> Double {
        if count >= 0,
           let nextOperand = currentOperand?.next,
           let operatorToCalculate = currentOperator {
            
            if operatorToCalculate.value == Operator.divide,
               nextOperand.value == 0 {
                throw CalculationError.dividedZero
            } else {
                result = operatorToCalculate.value.calculate(lhs: result, rhs: nextOperand.value)
                self.count -= 1
                currentOperand = currentOperand?.next
                currentOperator = currentOperator?.next
                return try result(count)
            }
        } else {
            return result
        }
    }
}
