//
//  DecimalCalculator.swift
//  Calculator
//
//  Created by Neph on 2021/03/23.
//

import Foundation

class DecimalCalculator: Computable, Resettable {
    
    var stack = Stack.shared
    //instance를 let으로 선언하여도 class의 property는 변경할 수 있는데 왜 여기선 Left side of mutating operator isn't mutable: 'stack' is a 'let' constant 와 같은 에러가 날까
    
    func add(firstNumber: String, secondNumber: String) -> String {
        guard let first = Double(firstNumber),
              let second = Double(secondNumber) else {
            return ""
        }
        let result = first + second
        return String(result)
    }
    
    func subtract(firstNumber: String, secondNumber: String) -> String {
        guard let first = Double(firstNumber),
              let second = Double(secondNumber) else {
            return ""
        }
        let result = first - second
        return String(result)
    }
    
    func multiply(firstNumber: String, secondNumber: String) -> String {
        guard let first = Double(firstNumber),
              let second = Double(secondNumber) else {
            return ""
        }
        let result = first * second
        return String(result)
    }
    
    func divide(firstNumber: String, secondNumber: String) -> String {
        guard let first = Double(firstNumber),
              let second = Double(secondNumber) else {
            return ""
        }
        let result = first / second
        return String(result)
    }
    
    func reset() {
        
    }
    
}
