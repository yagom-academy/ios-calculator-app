//
//  Binary.swift
//  Calculator
//
//  Created by 김민성 on 2021/03/27.
//

import Foundation

class BinaryCalculation {
    
    var rightOperand = UInt8()
    var leftOperand = UInt8()
    var operand = UInt8()
    
    private func pad(string : String, toSize: Int) -> String {
        var padded = string
        for _ in 0..<(toSize - string.count) {
            padded = "0" + padded
        }
        return padded
    }
    @discardableResult
    func calculatePostfixNotation(_ input: InputDataValidator) -> Result<String, Error> {
        var operandStack = Stack<UInt8>()
        
        for element in input.data.postfixNotation {
            if !Operators.list.contains(element) {
                guard let numbers = UInt8(element, radix: 2) else {
                    return .failure(.invalidAccess)
                }
                
                operandStack.push(numbers)
            }
            else if element == Operators.NOT.rawValue {
                guard let popped = operandStack.pop() else {
                    return .failure(.invalidAccess)
                }
                
                operand = (popped.value)
                operandStack.push(~operand)
            }
            else {
                guard let firstPoppedValue = operandStack.pop(), let secondPoppedValue = operandStack.pop() else {
                    return .failure(.invalidAccess)
                }
                
                rightOperand = firstPoppedValue.value
                leftOperand = secondPoppedValue.value
                
                switch element {
                case ">>" :
                    operandStack.push(leftOperand >> rightOperand)
                case "<<" :
                    operandStack.push(leftOperand << rightOperand)
                case "&" :
                    operandStack.push(leftOperand & rightOperand)
                case "|" :
                    operandStack.push(leftOperand | rightOperand)
                case "^" :
                    operandStack.push(leftOperand ^ rightOperand)
                case "~&" :
                    operandStack.push(leftOperand ~& rightOperand)
                case "~|" :
                    operandStack.push(leftOperand ~| rightOperand)
                case "+" :
                    operandStack.push(leftOperand &+ rightOperand)
                case "-" :
                    operandStack.push(leftOperand &- rightOperand)
                default:
                    return .failure(.invalidOperation)
                }
            }
        }
        guard let result = operandStack.peek() else {
            return .failure(.invalidAccess)
        }
        
        let binaryNumber = String(result.value, radix: 2)
        return .success(pad(string: binaryNumber, toSize: 8))
    }
}

