//
//  Calculator.swift
//  Calculator
//
//  Created by 잼킹 on 2021/03/26.
//

import Foundation

class Calculator {
    var kinds: CalculatorKinds
    
    init(kinds: CalculatorKinds) {
        self.kinds = kinds
    }
    
    func operate(operatorType: Operator, firstInputValue: String, secondInputValue: String) -> String {
        if kinds == CalculatorKinds.decimal {
            guard let firstNumber = Double(firstInputValue), let secondNumber = Double(secondInputValue) else {
                return "0"
            }
            switch operatorType {
            case .plus:
                return String(firstNumber + secondNumber)
            case .subtrack:
                return String(firstNumber - secondNumber)
            default:
                return "0"
            }
        } else {
            guard let firstNumber = Int(firstInputValue), let secondNumber = Int(secondInputValue) else {
                return "0"
            }
            switch operatorType {
            case .plus:
                return String(firstNumber + secondNumber, radix: 2)
            case .subtrack:
                return String(firstNumber - secondNumber, radix: 2)
            default:
                return "0"
            }
        }
    }
}
