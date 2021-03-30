//
//  Binary.swift
//  Calculator
//
//  Created by 김민성 on 2021/03/27.
//

import Foundation

class BinaryCalculation: Calculatable {
    var firstOperand = Int()
    var secondOperand = Int()
    
    func pad(string : String, toSize: Int) -> String {
        var padded = string
        for _ in 0..<(toSize - string.count) {
            padded = "0" + padded
        }
        return padded
    }
    
    func calculatePostfixNotation() {
        var operandStack = Stack<Int>()
        
        for element in Data.postfixNotation {
            if !Operators.list.contains(element) {
                guard let numbers = Int(element) else { return }
                
                operandStack.push(numbers)
            }
            else if element == "~" {
                guard let firstPoppedValue = operandStack.pop() else { return }
                
                firstOperand = firstPoppedValue.value
                let binaryNumber = UInt8((firstOperand))
                let resultNumber = Int(~binaryNumber)
                operandStack.push(resultNumber)
            }
            else if element == "~&" || element == "~|" || element == "+" || element == "-" {
                guard let firstPoppedValue = operandStack.pop(), let secondPoppedValue = operandStack.pop() else { return }
                
                firstOperand = firstPoppedValue.value
                secondOperand = secondPoppedValue.value
                let firstBinaryNumber = UInt8(firstOperand)
                let secondBinaryNumber = UInt8(secondOperand)
                
                switch element {
                case "~&" :
                    operandStack.push(Int(firstBinaryNumber ~& secondBinaryNumber))
                case "~|" :
                    operandStack.push(Int(firstBinaryNumber ~| secondBinaryNumber))
                case "+" :
                    operandStack.push(Int(firstBinaryNumber &+ secondBinaryNumber))
                case "-" :
                    operandStack.push(Int(secondBinaryNumber &- firstBinaryNumber))
                default :
                    return
                }
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

