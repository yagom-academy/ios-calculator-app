//
//  DecimalCalcultor.swift
//  Calculator
//
//  Created by handsome steven on 2021/03/26.
//

import Foundation

class DecimalCalculator {
    var operands = Stack<Double>()
    var operators = Stack<String>()
    var tempNumber = ""
    var screenNumber = "0"
    var operationFunctions: [String : (Double, Double) -> Double] = [:]

    init() {
        operationFunctions["+"] = { $0 + $1 }
        operationFunctions["-"] = { $0 - $1 }
        operationFunctions["x"] = { $0 * $1 }
        operationFunctions["/"] = { $0 / $1 }
    }
 
    private func calculate() {
        guard let operatorSign = operators.pop(),
            let operationFunction = operationFunctions[operatorSign],
            let secondOperand = operands.pop(),
            let firstOperand = operands.pop() else { return }
        let result: Double = operationFunction(firstOperand, secondOperand)
        operands.push(result)
    }

    func reset() {
        operands.clear()
        operators.clear()
        tempNumber = ""
        screenNumber = "0"
    }

    private func updateScreenNumber() {
        guard let lastOperand = operands.top() else { return }
        screenNumber = String(lastOperand)
    }

    func isExistDecimalPoint(_ buttonType: String) -> Bool {
        if buttonType == "." && tempNumber.contains(".") {
            return true 
        }
        return false
    }

    func isOverFlowedNineDigits(_ buttonType: String) -> Bool {
        var digitCount = 0
        for number in tempNumber {
            let characterValue = number as Character
            if (characterValue.isNumber) {
                digitCount += 1
            }
        }
        if digitCount >= 9 {
            return true
        }
        return false
    }

    func concatenateNumberOrDot(_ buttonType: String) {
        if isOverFlowedNineDigits(buttonType) {
            return
        } 
        if isExistDecimalPoint(buttonType) {
            return
        }
        if tempNumber == "0" && buttonType != "." {
            tempNumber = buttonType
            return
        } else if tempNumber == "" && buttonType == "." {
            tempNumber = "0."
            return
        }
        tempNumber += buttonType
    }

    func inputMathematicsSign(buttonText: String) {
        switch buttonText {
            case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "." :
                concatenateNumberOrDot(buttonText)
                screenNumber = (Double(tempNumber)?.applyNumberFormatter())!
            case "+", "-", "x", "/":
                guard let doubleValue = Double(tempNumber) else { return }
                operands.push(doubleValue)
                if buttonText == "+" || buttonText == "-" {
                    while !operators.isEmpty() {
                        calculate()
                    }
                } else if buttonText == "x" || buttonText == "/" {
                    while operators.top() == "x" || operators.top() == "/" {
                        calculate()
                    }
                }
                updateScreenNumber()
                operators.push(buttonText)
                tempNumber = ""
            case "c":
                reset()
            case "=":
                guard let doubleValue = Double(tempNumber) else { return }
                operands.push(doubleValue)
                if operands.count == operators.count {
                // TODO: 마지막 입력이 연산자 이고 그 다음 "="을 눌렀을 때 마지막 피연산자와 연산자를 프로퍼티로 저장
                    operands.push(doubleValue)
                }
                // TODO: "="을 계속 눌렀을 때 처리
                while !operators.isEmpty() {
                    calculate()
                }
                updateScreenNumber()
                tempNumber = String(operands.top()!)
            default:
                print("input error")
        }
    }
}

extension Double {
    func applyNumberFormatter()-> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 9
        return numberFormatter.string(for: self)!
    }
}
