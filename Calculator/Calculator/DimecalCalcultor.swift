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
    var temp = 0 
    var screenNumber = "0"

    var operationFunctions: [String : (Int, Int) -> Int] = [:]

    init() {
        operationFunctions["+"] = { $0 + $1 }
        operationFunctions["-"] = { $0 - $1 }
        operationFunctions["*"] = { $0 * $1 }
        operationFunctions["/"] = { $0 / $1 }
    }
 
/* 채팅창
neph 화이팅
*/
    func receiveInput(buttonType: String) {
        print("Receive input: \(buttonType)")
        switch buttonType {
            case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" :
                guard let intValue = Int(buttonType) else { return }
                temp = temp * 10 + intValue
                screenNumber = String(temp)
            case "+", "-", "*", "/":
                operands.push(temp) // 피연산자
                if buttonType == "+" || buttonType == "-" {
                    while !operators.isEmpty() {
                        // 연산자 스택에 가장 상단에 있는 연산 기호 가져오기
                        guard let operatorSign = operators.pop() else { print("operatorSign"); return }
                        // 가져온 기호로 함수 저장
                        guard let operationFunction = operationFunctions[operatorSign] else { print("operationFunction"); return }
                        guard let secondOperand = operands.pop() else { print("secondOperand"); return }
                        guard let firstOperand = operands.pop() else { print("firstOperand"); return }
                        let result: Int = operationFunction(firstOperand, secondOperand)
                        operands.push(result)
                    }
                } else if buttonType == "*" || buttonType == "/" {
                    // guard let lastOperator = operators.top() ??  else { return }
                    // 연산자 스택에 가장 상단에 있는 연산 기호 가져오기
                    while operators.top() == "*" || operators.top() == "/" {
                        guard let operatorSign = operators.pop() else { print("operatorSign"); return }
                        // 가져온 기호로 함수 저장
                        guard let operationFunction = operationFunctions[operatorSign] else { print("operationFunction"); return }
                        guard let secondOperand = operands.pop() else { print("secondOperand"); return }
                        guard let firstOperand = operands.pop() else { print("firstOperand"); return }
                        let result: Int = operationFunction(firstOperand, secondOperand)
                        operands.push(result)
                    }
                }
                guard let lastOperand = operands.top() else { return }
                screenNumber = String(lastOperand)
                operators.push(buttonType)
                temp = 0
            case "c":
                operands.clear()
                operators.clear()
                temp = 0
                screenNumber = "0"
            default:
                print("input error")           
        }
        print(operators)
        print(operands)
    }
}

