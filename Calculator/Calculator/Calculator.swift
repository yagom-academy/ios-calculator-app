//
//  Calculator.swift
//  Calculator
//
//  Created by 강인희 on 2020/12/09.
//

import Foundation

protocol BasicCalculator {
    var operators: Set<String> { get }
    mutating func calculate(value: String, by tappedOperator: String)
    mutating func result()
    mutating func reset()
}

struct DecimalCalculator: BasicCalculator {
    let operators: Set<String> = ["+","-","*","/"]
    private var decimalAdder = Stack<Double>()
    
    mutating func calculate(value: String, by tappedOperator: String) {
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
    

    mutating func result() {
        var result: Double = 0
        
        while !decimalAdder.isEmpty {
            if let valueToAdd = decimalAdder.pop() {
                result += valueToAdd
            }
        }
        decimalAdder.push(result)
    }
    
    mutating func reset() {
            decimalAdder.removeAll()
    }
}

struct BinaryCalculator: BasicCalculator {
    let operators: Set<String> = ["+","-","NOT", "AND", "OR","NOR","NAND","XOR","<<",">>"]
    private var binaryAdder = Stack<Int>()
    
    mutating func calculate(value: String, by tappedOperator: String) {
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
                result()
                if let operatingValue = binaryAdder.pop() {
                    binaryAdder.push(~operatingValue)
                }
            case "AND":
                result()
                if let operatingValue = binaryAdder.pop() {
                    binaryAdder.push(operatingValue & operand)
                }
            case "OR":
                result()
                if let operatingValue = binaryAdder.pop() {
                    binaryAdder.push(operatingValue | operand)
                }
            case "NOR":
                result()
                if let operatingValue = binaryAdder.pop() {
                    binaryAdder.push(~(operatingValue | operand))
                }
            case "NAND":
                result()
                if let operatingValue = binaryAdder.pop() {
                    binaryAdder.push(~(operatingValue & operand))
                }
            case "XOR":
                result()
                if let operatingValue = binaryAdder.pop() {
                    binaryAdder.push(operatingValue ^ operand)
                }
            case "<<":
                result()
                if let operatingValue = binaryAdder.pop() {
                    binaryAdder.push(operatingValue << 1)
                }
            case ">>":
                result()
                if let operatingValue = binaryAdder.pop() {
                    binaryAdder.push(operatingValue >> 1)
                }
            case "=":
                var result: Int = 0
                
                while !binaryAdder.isEmpty {
                    if let valueToAdd = binaryAdder.pop() {
                        result += valueToAdd
                    }
                }
                binaryAdder.push(result)
            default:
                return
            }
        }
    }
 
    mutating func result() {
        var result: Int = 0
        
        while !binaryAdder.isEmpty {
            if let valueToAdd = binaryAdder.pop() {
                result += valueToAdd
            }
        }
        binaryAdder.push(result)
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
