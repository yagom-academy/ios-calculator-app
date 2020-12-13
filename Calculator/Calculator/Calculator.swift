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
    var arithmeticOperatorSet: Set<String> { get }
    var displayedValue: String { get }
    func calculate(value: String, by tappedOperator: String)
    func reset()
}

struct DecimalCalculator: BasicCalculator {
    let arithmeticOperatorSet: Set<String> = ["+","-","*","/"]
    var displayedValue: String {
        get {
            return String(decimalAdder.reduce(0){$0 + $1})
        }
    }
    
    func calculate(value: String, by tappedOperator: String = "+") {
        guard arithmeticOperatorSet.contains(tappedOperator),
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
    var displayedValue: String {
        get {
            return String(binaryAdder.reduce(0){$0 + $1})
        }
    }
    let shiftOperatorSet: Set<String> = ["<<",">>"]
    let arithmeticOperatorSet: Set<String> = ["+","-"]
    let bitwiseOperatorSet: Set<String> = ["NOT", "AND", "OR","NOR","NAND","XOR"]
    
    func calculate(value: String, by tappedOperator: String = "+") {
        guard let operand = Int(value) else {
            return
        }
        
        if shiftOperatorSet.contains(tappedOperator) {
            switch tappedOperator {
            case "<<":
                    binaryAdder.append(operand << 1)
            case ">>":
                    binaryAdder.append(operand >> 1)
            default:
                return
            }
        } else if arithmeticOperatorSet.contains(tappedOperator) {
            switch tappedOperator {
            case "+":
                binaryAdder.append(operand)
            case "-":
                binaryAdder.append(-operand)
            default:
                return
            }
        } else if bitwiseOperatorSet.contains(tappedOperator) {
            switch tappedOperator {
            case "NOT":
                binaryAdder.append(~operand)
            case "AND":
                if let operatingValue = binaryAdder.popLast() {
                    binaryAdder.append(operatingValue & operand)
                }
            case "OR":
                if let operatingValue = binaryAdder.popLast() {
                    binaryAdder.append(operatingValue | operand )
                }
            case "NOR":
                if let operatingValue = binaryAdder.popLast() {
                    binaryAdder.append(~(operatingValue | operand) )
                }
            case "NAND":
                if let operatingValue = binaryAdder.popLast() {
                    binaryAdder.append(~(operatingValue & operand) )
                }
            case "XOR":
                if let operatingValue = binaryAdder.popLast() {
                    binaryAdder.append(operatingValue ^ operand)
                }
            default:
                return
            }
        }
    }
    
    func reset() {
        binaryAdder = []
    }
}
