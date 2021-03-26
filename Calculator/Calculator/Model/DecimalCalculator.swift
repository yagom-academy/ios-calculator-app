//
//  DecimalCalculator.swift
//  Calculator
//
//  Created by 잼킹 on 2021/03/26.
//

import Foundation

class DecimalCalculator: Calculator {
    override func operate(operatorType: Operator, firstInputValue: String, secondInputValue: String) -> String {
        guard let firstNumber = Double(firstInputValue), let secondNumber = Double(secondInputValue) else {
            return "0"
        }
        switch operatorType {
        case .plus:
            return String(firstNumber + secondNumber)
        case .subtrack:
            return String(firstNumber - secondNumber)
        case .multiple:
            return String(firstNumber * secondNumber)
        case .divide:
            return String(firstNumber / secondNumber)
        default:
            return "0"
        }
    }
}

let calculator = DecimalCalculator(kinds: .decimal)
