//
//  Calculator.swift
//  Calculator
//
//  Created by Seungjin Baek on 2021/03/25.
//

import Foundation

protocol DecimalOperator {
    func multiply(firstElement: Double, secondElement: Double) -> Double
    func divide(firstElement: Double, secondElement: Double) -> Double
}

protocol BinaryOperator {
    func andOperation(firstElement: Int, secondElement: Int) -> Int
    func nandOperation(firstElement: Int, secondElement: Int) -> Int
    func orOperation(firstElement: Int, secondElement: Int) -> Int
    func norOperation(firstElement: Int, secondElement: Int) -> Int
    func xorOperation(firstElement: Int, secondElement: Int) -> Int
    func leftShift(element: Int) -> Int
    func rightShift(element: Int) -> Int
    func notOperation(element: Int) -> Int
}

class Calculator {
    func add(firstElement: Double, secondElement: Double) -> Double {
        return firstElement + secondElement
    }
    
    func subtract(firstElement: Double, secondElement: Double) -> Double {
        return firstElement - secondElement
    }

    func clear() {

    }
}

class DecimalCalculator: Calculator, DecimalOperator {
    func multiply(firstElement: Double, secondElement: Double) -> Double {
        return firstElement * secondElement
    }
    
    func divide(firstElement: Double, secondElement: Double) -> Double {
        return firstElement / secondElement
    }
}

class BinaryCalculator: Calculator, BinaryOperator {
    func andOperation(firstElement: Int, secondElement: Int) -> Int {
        return firstElement & secondElement
    }
    
    func nandOperation(firstElement: Int, secondElement: Int) -> Int {
        return ~(firstElement & secondElement)
    }
    
    func orOperation(firstElement: Int, secondElement: Int) -> Int {
        return firstElement | secondElement
    }
    
    func norOperation(firstElement: Int, secondElement: Int) -> Int {
        return ~(firstElement | secondElement)
    }
    
    func xorOperation(firstElement: Int, secondElement: Int) -> Int {
        return firstElement ^ secondElement
    }
    
    func leftShift(element: Int) -> Int {
        return element << 1
    }
    
    func rightShift(element: Int) -> Int {
        return element >> 1
    }
    
    func notOperation(element: Int) -> Int {
        return ~element
    }
}



