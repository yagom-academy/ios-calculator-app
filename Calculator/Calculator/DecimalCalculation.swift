//
//  Decimal.swift
//  Calculator
//
//  Created by 김민성 on 2021/03/30.
//

import Foundation

class DecimalCalculation: Calculatable {
    var firstOperand = Double()
    var secondOperand = Double()
    
    func calculatePostfixNotation() {
        var operandStack = Stack<Double>()

        for element in Data.postfixNotation {
            if !Operators.list.contains(element) {
                guard let numbers = Double(element) else { return }
                
                operandStack.push(numbers)
            }
            else {
                guard let firstPoppedValue = operandStack.pop(),
                      let secondPoppedValue = operandStack.pop() else { return }
                
                firstOperand = firstPoppedValue.value
                secondOperand = secondPoppedValue.value
                
                switch element {
                case "*" :
                    operandStack.push(secondOperand * firstOperand)
                case "/" :
                    operandStack.push(secondOperand / firstOperand)
                case "+" :
                    operandStack.push(secondOperand + firstOperand)
                case "-" :
                    operandStack.push(secondOperand - firstOperand)
                default:
                    return
                }
            }
        }
    }
}
