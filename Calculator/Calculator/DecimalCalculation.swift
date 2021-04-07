//
//  Decimal.swift
//  Calculator
//
//  Created by 김민성 on 2021/03/30.
//

import Foundation

class DecimalCalculation: Calculatable {
    var rightOperand = Double()
    var leftOperand = Double()
    let numberFormatter = NumberFormatter()

    private func dropDigits(_ input: Double) -> String {
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .floor
        numberFormatter.maximumSignificantDigits = 9
        
        if input >= 0 && input < 1 {
            numberFormatter.maximumSignificantDigits = 8
        }
        else if input < 0 {
            numberFormatter.roundingMode = .ceiling
        }
        
        return numberFormatter.string(for: input)!
    }
   
    func calculate(_ input: Data) -> Result <String, CalculationError> {
        var operandStack = Stack<Double>()
        
        for element in input.postfixNotation {
            if !Operators.list.contains(element) {
                guard let numbers = Double(element) else {
                    return .failure(.invalidAccess)
                }
            
                operandStack.push(numbers)
            }
            else {
                guard let firstPoppedValue = operandStack.pop(),
                      let secondPoppedValue = operandStack.pop() else {
                    return .failure(.invalidAccess)
                }
                
                rightOperand = firstPoppedValue.value
                leftOperand = secondPoppedValue.value
                
                switch element {
                case "*" :
                    operandStack.push(leftOperand * rightOperand)
                case "/" :
                    operandStack.push(leftOperand / rightOperand)
                case "+" :
                    operandStack.push(leftOperand + rightOperand)
                case "-" :
                    operandStack.push(leftOperand - rightOperand)
                default:
                    return .failure(.invalidOperation)
                }
            }
        }
        guard let peek = operandStack.peek() else {
            return .failure(.invalidAccess)
        }
        return .success((dropDigits(peek.value)))
    }
}
