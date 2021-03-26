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
    var operands = Stack<Int>()
    var operators = Stack<String>()
    var tempNumber = 0
    var screenNumber = "0"

    var operationFunctions: [String : (Int, Int) -> Int] = [:]

    init() {
        operationFunctions["+"] = { $0 + $1 }
        operationFunctions["-"] = { $0 - $1 }
        operationFunctions["*"] = { $0 * $1 }
        operationFunctions["/"] = { $0 / $1 }
    }
 
    private func calculateUntilSatisfiedCondition() {
        guard let operatorSign = operators.pop() else { return }
        guard let operationFunction = operationFunctions[operatorSign] else { return }
        guard let secondOperand = operands.pop() else { return }
        guard let firstOperand = operands.pop() else { return }
        let result: Int = operationFunction(firstOperand, secondOperand)
        operands.push(result)
    }

    private func reset() {
        operands.clear()
        operators.clear()
        tempNumber = 0
        screenNumber = "0"
    }

    private func updateScrennNumber() {
        guard let lastOperand = operands.top() else { return }
        screenNumber = String(lastOperand)
    }

/* 채팅창
neph 화이팅
sj 


*/

    func receiveInput(buttonType: String) {
        switch buttonType {
            case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" :
                guard let intValue = Int(buttonType) else { return }
                tempNumber = tempNumber * 10 + intValue
                screenNumber = String(tempNumber)
            case "+", "-", "*", "/":
                operands.push(tempNumber) 
                if buttonType == "+" || buttonType == "-" {
                    while !operators.isEmpty() {
                        calculateUntilSatisfiedCondition()
                    }
                } else if buttonType == "*" || buttonType == "/" {
                    while operators.top() == "*" || operators.top() == "/" {
                        calculateUntilSatisfiedCondition()
                    }
                }
                updateScrennNumber()
                operators.push(buttonType)
                tempNumber = 0
            case "c":
                reset()
            default:
                print("input error")           
        }
    }
}

