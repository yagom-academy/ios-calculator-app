//
//  Formula.swift
//  Calculator
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<String>
    
    func result() throws -> Double {
        var result: Double = operands.list.head?.value ?? 0
        var currentOperand = operands.list.head
        var currentOperator = operators.list.head
        var calculationCount: Int = 0
        
        while calculationCount != operators.count {
            guard let nextOperand = currentOperand?.next,
                  let operatorToCalculate = currentOperator,
                  let operatorCase = Operator(rawValue: Character(operatorToCalculate.value)) else {
                return result
            }
            
            if operatorCase == Operator.divide, nextOperand.value == 0 {
                throw CalculationError.dividedZero
            } else {
                result = operatorCase.calculate(lhs: result, rhs: nextOperand.value)
                calculationCount += 1
                currentOperand = currentOperand?.next
                currentOperator = currentOperator?.next
            }
        }
        return result
    }
}
