//
//  BinaryCalculator.swift
//  Calculator
//
//  Created by Neph on 2021/03/23.
//

final class BinaryCalculator: Calculator {

    var numberStack = Stack<Int>()
    var operatorStack = Stack<Operator>()
    static var shared = BinaryCalculator()
    
    func AND(firstNumber: Int, secondNumber: Int) -> Int {
        return firstNumber & secondNumber
    }
    
    func NAND(firstNumber: Int, secondNumber: Int) -> Int {
        return ~(firstNumber & secondNumber)
    }
    
    func OR(firstNumber: Int, secondNumber: Int) -> Int {
        return firstNumber | secondNumber
    }
    
    func NOR(firstNumber: Int, secondNumber: Int) -> Int {
        return ~(firstNumber | secondNumber)
    }
    
    func XOR(firstNumber: Int, secondNumber: Int) -> Int {
        return firstNumber ^ secondNumber
    }
    
    func NOT(firstNumber: Int) -> Int {
        return ~firstNumber
    }
    
    func shiftLeft(firstNumber: Int, secondNumber: Int) -> Int {
        return firstNumber << secondNumber
    }
    
    func shiftRight(firstNumber: Int, secondNumber: Int) -> Int {
        return firstNumber >> secondNumber
    }
    
    func formatInput(_ input: String) throws -> Int {
        guard input.count <= 8,
            var number = Int(input, radix: 2) else {
            throw CalculatorError.outOfRangeInput
        }
        
        if number > 128 {
            number -= 1
            number ^= 255
            number *= -1
        }
        
        return number
    }
    
    func formatResult(of result: Int) throws -> String {
        var result = result
        if result >= 128 {
            throw CalculatorError.outOfRangeInput
        } else if result < 0 {
            result = 1 << 8 + result
        }
        return String(result, radix: 2)
    }
    
    func reset() {
        operatorStack.reset()
        numberStack.reset()
    }
    
}
