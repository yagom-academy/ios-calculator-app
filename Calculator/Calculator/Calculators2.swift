//
//  File.swift
//  Calculator
//
//  Created by Seungjin Baek on 2021/03/26.
//

import Foundation

protocol DecimalOperator {
    func multiply()
    func divide()
}

protocol BinaryOperator {
    func andOperation()
    func nandOperation()
}

class Operator: DecimalOperator, BinaryOperator {
    func add() {
        print("test")
    }
    
    func subtract() {
        print("test2")
    }
    
    func multiply() {
        print("test3")
    }
    
    func divide() {
        print("test4")
    }
    
    func andOperation() {
        print("test5")
    }
    
    func nandOperation() {
        print("test6")
    }
}

struct Calculator {
    var decimalCalculator: DecimalOperator?
    var binaryCalculator: BinaryOperator?
    
    func multiply() {
        decimalCalculator?.multiply()
    }
    
    func andOperation() {
        binaryCalculator?.andOperation()
    }
    
}

let calculator = Calculator(decimalCalculator: Operator())
let calcul2 = Calculator(binaryCalculator: Operator())
