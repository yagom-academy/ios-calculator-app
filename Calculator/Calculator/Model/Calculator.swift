//
//  Calculator.swift
//  Calculator
//
//  Created by Ellen on 2021/06/24.
//

import Foundation


class Calculator {
    var numberStack = [String]()
    var result = ""
    var postfix = Postfix()
    
    func isNumberInPostfix(item: String) -> Bool {
        let operators = ["+","−","×","÷"]
        
        if operators.contains(item) {
            return false
        }
        return true
    }
    
    func calculatePostfix() -> [String] {
        for item in postfix.postfix {
            if isNumberInPostfix(item: item) {
                numberStack.append(item)
            }else {
                let second = numberStack.removeLast()
                let first = numberStack.removeLast()
                let calculateResult = realCalculator(first: first, second: second, oper: item)
                numberStack.append(String(calculateResult))
            }
        }
        return numberStack
    }
    
    func realCalculator(first: String, second: String, oper: String) -> Double {
        guard let first = Double(first) , let second = Double(second) else {
            return  10000000
        }
        switch oper {
        case "+":
            return first + second
        case "−":
            return first - second
        case "×":
            return first * second
        case "÷":
            return first / second
        default:
            return 10000000
        }
    }
}
