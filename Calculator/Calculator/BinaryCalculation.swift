//
//  Binary.swift
//  Calculator
//
//  Created by 김민성 on 2021/03/27.
//

import Foundation

class BinaryCalculation: Calculatable {
    var firstOperand = UInt8()
    var secondOperand = UInt8()
    
    private func pad(string : String, toSize: Int) -> String {
        var padded = string
        for _ in 0..<(toSize - string.count) {
            padded = "0" + padded
        }
        return padded
    }
    
    func calculatePostfixNotation(_ input: InputDataValidator) {
        var operandStack = Stack<UInt8>()
        
        for element in input.data.postfixNotation {
            if !Operators.list.contains(element) {
                guard let numbers = UInt8(element, radix: 2) else { return }
                
                operandStack.push(numbers)
            }
            else if element == Operators.NOT.rawValue {
                guard let popped = operandStack.pop() else { return }
                
                firstOperand = popped.value
                operandStack.push(~firstOperand)
            }
            else {
                guard let firstPoppedValue = operandStack.pop(), let secondPoppedValue = operandStack.pop() else { return }
                
                firstOperand = firstPoppedValue.value
                secondOperand = secondPoppedValue.value
                
                switch element {
                case ">>" :
                    operandStack.push(secondOperand >> firstOperand)
                case "<<" :
                    operandStack.push(firstOperand << secondOperand)
                case "&" :
                    operandStack.push(secondOperand & firstOperand)
                case "|" :
                    operandStack.push(secondOperand | firstOperand)
                case "^" :
                    operandStack.push(secondOperand ^ firstOperand)
                case "~&" :
                    operandStack.push(firstOperand ~& secondOperand)
                case "~|" :
                    operandStack.push(firstOperand ~| secondOperand)
                case "+" :
                    operandStack.push(firstOperand &+ secondOperand)
                case "-" :
                    operandStack.push(secondOperand &- firstOperand)
                default:
                    return
                }
            }
        }
        guard let result = operandStack.peek() else { return }
        
        let binaryNumber = String(result.value, radix: 2)
        print(pad(string: binaryNumber, toSize: 8))
    }
}

