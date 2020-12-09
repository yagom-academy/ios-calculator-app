//
//  BinaryCalculator.swift
//  Calculator
//
//  Created by Yeon on 2020/12/07.
//

import Foundation

protocol BinaryCalculable {
    func and(first: String, second: String)
    func or(first: String, second: String)
    func xor(first: String, second: String)
    func nor(first: String, second: String)
    func not(first: String, second: String)
    func nand(first: String, second: String)
    func rightShift()
    func leftShift()
}

class BinaryCalculator: BasicCalculable, BinaryCalculable {
    var binaryStack: Stack = Stack<Int>()
    
    func add(first: String, second: String) -> String {
        var result: Int
        guard let firstNumber = Int(first, radix: 2), let secondNumber = Int(second, radix: 2) else {
            return ""
        }
        result = firstNumber + secondNumber
        return String(describing: result)
    }

    func subtract(first: String, second: String) -> String {
        var result: Int
        guard let firstNumber = Int(first, radix: 2), let secondNumber = Int(second, radix: 2) else {
            return ""
        }
        result = firstNumber - secondNumber
        return String(describing: result)
    }

    func multiply(first: String, second: String) -> String {
        var result: Int
        guard let firstNumber = Int(first, radix: 2), let secondNumber = Int(second, radix: 2) else {
            return ""
        }
        result = firstNumber * secondNumber
        return String(describing: result)
    }

    func clear() {
        binaryStack.removeAll()
    }

    func and(first: String, second: String) {
        
    }

    func or(first: String, second: String) {
        
    }

    func xor(first: String, second: String) {
        
    }

    func nor(first: String, second: String) {
        
    }

    func not(first: String, second: String) {
        
    }

    func nand(first: String, second: String) {
        
    }

    func rightShift() {
        
    }

    func leftShift() {
        
    }

}

