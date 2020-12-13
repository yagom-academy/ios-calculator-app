//
//  Calculator.swift
//  Calculator
//
//  Created by 강인희 on 2020/12/09.
//

import Foundation

private var decimalAdder = [Double]()
private var binaryAdder = [Int]()

protocol BasicCalculator {
    var arithmeticOperators: Set<String> { get }
    var displayedValue: String { get }
    func calculate(value: String, by tappedOperator: String)
    func reset()
}

struct DecimalCalculator: BasicCalculator {
    let arithmeticOperators: Set<String> = ["+","-","*","/"]
    
    var displayedValue: String {
        get {
            return String(decimalAdder.reduce(0){$0 + $1})
        }
    }
    
    func calculate(value: String, by tappedOperator: String = "+") {
        guard arithmeticOperators.contains(tappedOperator),
              let operand = Double(value) else {
            return
        }
        
        switch tappedOperator {
        case "+":
            decimalAdder.append(operand)
        case "-":
            decimalAdder.append(-operand)
        case "*":
            if let multiplicand = decimalAdder.popLast() {
                decimalAdder.append(multiplicand * operand)
            }
        case "/":
            if let dividend = decimalAdder.popLast() {
                decimalAdder.append(dividend / operand)
            }
        default:
            return
        }
    }
    
    func reset() {
        decimalAdder = []
    }
}

struct BinaryCalculator: BasicCalculator {
    let arithmeticOperators: Set<String> = ["+","-"]
    let bitwiseOperators: Set<String> = ["NOT", "AND", "OR","NOR","NAND","XOR"]
    let shiftOperators: Set<String> = ["<<",">>"]
    
    var displayedValue: String {
        get {
            return String(binaryAdder.reduce(0){$0 + $1})
        }
    }
    
    func calculate(value: String, by tappedOperator: String = "+") {
        guard let operand = Int(value) else {
            return
        }
        
        if bitwiseOperators.contains(tappedOperator) {
            if let operatingValue = binaryAdder.popLast() {
                switch tappedOperator {
                case "+":
                    binaryAdder.append(operand)
                case "-":
                    binaryAdder.append(-operand)
                case "NOT":
                    binaryAdder.append(~operand)
                case "AND":
                    binaryAdder.append(operatingValue & operand)
                case "OR":
                    binaryAdder.append(operatingValue | operand)
                case "NOR":
                    binaryAdder.append(~(operatingValue | operand))
                case "NAND":
                    binaryAdder.append(~(operatingValue & operand))
                case "XOR":
                    binaryAdder.append(operatingValue ^ operand)
                case "<<":
                    binaryAdder.append(operand << 1)
                case ">>":
                    binaryAdder.append(operand >> 1)
                default:
                    return
                }
            }
        }
    }
    
    func reset() {
        binaryAdder = []
    }
}
