//
//  Formula.swift
//  Calculator
//
//  Created by Kay on 2022/05/20.
//

struct Formula {
    private var operands: CalculatorItemQueue<String>
    private var operators: CalculatorItemQueue<String>

    mutating func result() -> Double {
        var operandsNumberInDoubleFormat = Double(operands.dequeue() ?? "Wrong") ?? 0.0
        var calculationResult: Double = operandsNumberInDoubleFormat
        
        while operators.count != 0 {
            let operatorLetter = operators.dequeue() ?? "Error_Handling"
            let currentOperator = Character(operatorLetter)

            operandsNumberInDoubleFormat = Double(operands.dequeue() ?? "Wrong") ?? 0.0
            
            switch currentOperator {
            case "+":
                calculationResult = Operator.add.calculate(lhs: calculationResult, rhs: operandsNumberInDoubleFormat)
            case "-":
                calculationResult = Operator.subtract.calculate(lhs: calculationResult, rhs: operandsNumberInDoubleFormat)
            case "*":
                calculationResult = Operator.multiply.calculate(lhs: calculationResult, rhs: operandsNumberInDoubleFormat)
            case "/":
                calculationResult = Operator.divide.calculate(lhs: calculationResult, rhs: operandsNumberInDoubleFormat)
            default:
                calculationResult = 0.0
            }
        }
        return calculationResult
    }
}
