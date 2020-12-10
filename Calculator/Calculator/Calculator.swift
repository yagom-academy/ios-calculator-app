//
//  Calculator.swift
//  Calculator
//
//  Created by 강인희 on 2020/12/09.
//

import Foundation

private var addingStack = [Double]()

protocol BasicCalculator {
    var displayedValue: String { get }
    func calculate(value: String, by opreator: String)
    func reset()
}


struct DecimalCalculator: BasicCalculator {
    let operatorSet: Set<String> = ["+","-","*","/"]
    var displayedValue: String {
        get {
            return String(addingStack.reduce(0){$0 + $1})
        }
    }
    
    func calculate(value: String, by tappedOperator: String = "+") {
        guard operatorSet.contains(tappedOperator),
              let operand = Double(value) else {
            return
        }
        
        switch tappedOperator {
        case "+":
            addingStack.append(operand)
        case "-":
            addingStack.append(-operand)
        case "*":
            if let multiplicand = addingStack.popLast() {
                addingStack.append(multiplicand * operand)
            }
        case "/":
            if let dividend = addingStack.popLast() {
                addingStack.append(dividend / operand)
            }
        default:
            return
        }
    }
    
    func reset() {
        addingStack = []
    }
    
}
