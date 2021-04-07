//
//  Binary.swift
//  Calculator
//
//  Created by 김민성 on 2021/03/27.
//

import Foundation

class BinaryCalculation: Calculatable {
    var rightOperand = UInt()
    var leftOperand = UInt()
    var operand = UInt()
    var numberFormatter = NumberFormatter()

    private func pad(number : String, toSize: Int) -> String {
        var padded = number

        for _ in 0..<(toSize - padded.count) {
            padded = "0" + padded
        }
        return padded
    }

    private func filterResult(_ input: UInt) -> String {
        let binaryResult = String(input, radix: 2)
        
        if binaryResult.count > 9 {
            return "000000000"
        }
        else {
            return pad(number: binaryResult, toSize: 9)
        }
    }

    func calculate(_ input: Data) -> Result<String, CalculationError> {
        var operandStack = Stack<UInt>()

        for element in input.postfixNotation {
            if !Operators.list.contains(element) {
                
                guard let number = UInt(element, radix: 2) else {
                    return .failure(.invalidAccess)
                }
                
                operandStack.push(number)
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
        return .success(filterResult(result.value))
    }
}

