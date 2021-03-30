//
//  DimecalCalcultor.swift
//  Calculator
//
//  Created by handsome s on 2021/03/26.
//

import Foundation

struct Stack<T> {
    private var storage = Array<T>()
    
    var count: Int {
        return storage.count
    }
    
    mutating func push(_ T: T) {
        storage.append(T)
    }
    
    mutating func pop() -> T? {
        return storage.popLast()
    }
    
    mutating func clear() {
        storage.removeAll()
    }
    
    func top() -> T? {
        return storage.last
    }
    
    func isEmpty() -> Bool {
        return storage.isEmpty
    }
}


class Calculator {
    var operands = Stack<Double>()
    var operators = Stack<String>()
    var tempNumber = ""
    var screenNumber = "0"
    let numberFormatter = NumberFormatter()
    var operationFunctions: [String : (Double, Double) -> Double] = [:]

    init() {
        operationFunctions["+"] = { $0 + $1 }
        operationFunctions["-"] = { $0 - $1 }
        operationFunctions["*"] = { $0 * $1 }
        operationFunctions["/"] = { $0 / $1 }

        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 9
    }
 
    private func calculateUntilSatisfiedCondition() {
        guard let operatorSign = operators.pop() else { return }
        guard let operationFunction = operationFunctions[operatorSign] else { return }
        guard let secondOperand = operands.pop() else { return }
        guard let firstOperand = operands.pop() else { return }
        let result: Double = operationFunction(firstOperand, secondOperand)
        operands.push(result)
    }

    private func reset() {
        operands.clear()
        operators.clear()
        tempNumber = ""
        screenNumber = "0"
    }

    private func updateScreenNumber() {
        guard let lastOperand = operands.top() else { return }
        screenNumber = numberFormatter.string(for: lastOperand)!
    }

    func isExistDemicalPoint(_ buttonType: String) -> Bool {
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
        if isExistDemicalPoint(buttonType) {
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

    func receiveInput(buttonType: String) {
        switch buttonType {
            case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "." :
                concatenateNumberOrDot(buttonType)
                screenNumber = numberFormatter.string(for: Double(tempNumber))!
            case "+", "-", "*", "/":
                guard let doubleValue = Double(tempNumber) else { return }
                operands.push(doubleValue)
                if buttonType == "+" || buttonType == "-" {
                    while !operators.isEmpty() {
                        calculateUntilSatisfiedCondition()
                    }
                } else if buttonType == "*" || buttonType == "/" {
                    while operators.top() == "*" || operators.top() == "/" {
                        calculateUntilSatisfiedCondition()
                    }
                }
                updateScreenNumber()
                operators.push(buttonType)
                tempNumber = ""
            case "c":
                reset()
            case "=":
                guard let doubleValue = Double(tempNumber) else { return }
                // 마지막 연산자
                // 마지막 피연산자
                operands.push(doubleValue)
                if operands.count == operators.count {
                // TODO: 마지막 입력이 연산자 이고 그 다음 "="을 눌렀을 때 마지막 피연산자와 연산자를 프로퍼티로 저장
                    operands.push(doubleValue)
                }
                // TODO: "="을 계속 눌렀을 때 처리
                while !operators.isEmpty() {
                    calculateUntilSatisfiedCondition()
                }
                updateScreenNumber()
                tempNumber = String(operands.top()!)
            default:
                print("input error")
        }
    }
}

// extension Formatter {
//     static let numberFormatter: NumberFormatter = {
//         let formatter = NumberFormatter()
//         formatter.numberStyle = .decimal
//         return formatter
//     }()
// }
