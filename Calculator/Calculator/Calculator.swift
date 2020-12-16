//
//  Calculator.swift
//  Calculator
//
//  Created by 강인희 on 2020/12/09.
//

import Foundation

protocol BasicCalculator {
    var operators: Set<String> { get }
    mutating func calculate(by tappedOperator: String, of value: String)
    mutating func sumOfElementsInAdder() -> String
    mutating func reset()
}

struct DecimalCalculator: BasicCalculator {
    let operators: Set<String> = ["+","-","*","/"]
    private var decimalAdder = Stack<Double>()
    
    mutating func calculate(by tappedOperator: String, of value: String) {
        guard operators.contains(tappedOperator),
              let operand = Double(value) else {
            return
        }
        
        switch tappedOperator {
        case "+":
            decimalAdder.push(operand)
        case "-":
            decimalAdder.push(-operand)
        case "*":
            if let multiplicand = decimalAdder.pop() {
                decimalAdder.push(multiplicand * operand)
            }
        case "/":
            if let dividend = decimalAdder.pop() {
                decimalAdder.push(dividend / operand)
            }
        default:
            return
        }
    }
    
    mutating func sumOfElementsInAdder() -> String {
        var result: Double = 0
        
        while !decimalAdder.isEmpty {
            if let valueToAdd = decimalAdder.pop() {
                result += valueToAdd
            }
        }
        
        return String(result).trimmed
    }
    
    mutating func reset() {
        decimalAdder.removeAll()
    }
}

struct BinaryCalculator: BasicCalculator {
    let operators: Set<String> = ["+","-","NOT", "AND", "OR","NOR","NAND","XOR","<<",">>"]
    private var binaryAdder = Stack<Int>()
    
    mutating func calculate(by tappedOperator: String, of value: String) {
        guard let operand = Int(value) else {
            return
        }
        
        if operators.contains(tappedOperator) {
            switch tappedOperator {
            case "+":
                binaryAdder.push(operand)
            case "-":
                binaryAdder.push(-operand)
            case "NOT":
                if let operatingValue = Int(sumOfElementsInAdder(), radix: 2) {
                    binaryAdder.push(~operatingValue)
                }
            case "AND":
                if let operatingValue = Int(sumOfElementsInAdder(), radix: 2) {
                    binaryAdder.push(operatingValue & operand)
                }
            case "OR":
                if let operatingValue = Int(sumOfElementsInAdder(), radix: 2) {
                    binaryAdder.push(operatingValue | operand)
                }
            case "NOR":
                if let operatingValue = Int(sumOfElementsInAdder(), radix: 2) {
                    binaryAdder.push(~(operatingValue | operand))
                }
            case "NAND":
                if let operatingValue = Int(sumOfElementsInAdder(), radix: 2) {
                    binaryAdder.push(~(operatingValue & operand))
                }
            case "XOR":
                if let operatingValue = Int(sumOfElementsInAdder(), radix: 2) {
                    binaryAdder.push(operatingValue ^ operand)
                }
            case "<<":
                var operatingValue = binaryAdder.pop() ?? 0
                operatingValue = operatingValue << 1
                
                if String(operatingValue,radix: 2).count > 9 {
                    var convertedValue = String(operatingValue,radix: 2)
                    convertedValue.removeFirst()
                    operatingValue = Int(convertedValue, radix: 2) ?? 0
                }
                binaryAdder.push(operatingValue)
            case ">>":
                var operatingValue = binaryAdder.pop() ?? 0
                operatingValue = operatingValue >> 1
                
                if String(operatingValue,radix: 2).count > 9 {
                    var convertedValue = String(operatingValue,radix: 2)
                    convertedValue.removeLast()
                    operatingValue = Int(convertedValue, radix: 2) ?? 0
                }
                binaryAdder.push(operatingValue)
            default:
                return
            }
        }
    }
    
    mutating func sumOfElementsInAdder() -> String {
        var result: Int = 0
        
        while !binaryAdder.isEmpty {
            if let valueToAdd = binaryAdder.pop() {
                result += valueToAdd
            }
        }
        
        return String(result, radix:2).trimmed
    }

    mutating func reset() {
        binaryAdder.removeAll()
    }
}
extension String {
    var trimmed: String {
        guard self.count > 9 else {
            return self
        }
        
        let firstIndex = self.index(self.startIndex, offsetBy: 0)
        let lastIndex = self.index(self.startIndex, offsetBy: 9)
        
        return"\(self[firstIndex..<lastIndex])"
    }
}
