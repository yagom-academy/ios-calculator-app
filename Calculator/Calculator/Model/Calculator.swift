//  Calculator.swift
//  Calculator
//
//  Created by 요시킴
//

import Foundation

struct Calculator {
    
    private enum Operations: String {
        case plus = "+"
        case minus = "-"
        case multiply = "×"
        case divide = "÷"
        
        var description: String {
            return self.rawValue
        }
    }
    
    private var expressionEntry = [String]()
    
    mutating func enterExpression(operation: String, inputNumber: String) {
        if expressionEntry.isEmpty {
            expressionEntry.append(inputNumber)
        } else {
            expressionEntry.append(operation)
            expressionEntry.append(inputNumber)
        }
        print(expressionEntry)
    }
    
    mutating func allClear() {
        expressionEntry.removeAll()
    }

}

