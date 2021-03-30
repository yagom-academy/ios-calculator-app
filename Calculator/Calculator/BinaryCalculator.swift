//
//  BinaryCalculator.swift
//  Calculator
//
//  Created by Neph on 2021/03/23.
//

final class BinaryCalculator: Computable, Resettable {
    
    struct StackForBinaryCalculator {
        var number: String
        var operatorType: Operator
    }
    
    var stack = Stack<StackForBinaryCalculator>()
    
    init() {
        reset()
    }
    
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
        
        // 하위 8비트를 bitmask
        let bitmasker = ~0 - (1<<8 - 1)
        var result = ~(bitmasker ^ firstNumber)

        if result >= 256 {
            result %= 256
        }
        
        return result
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
    
    func formatResult(of result: Int) -> String {
        var result = result
        if result >= 128 {
            result %= 128
        } else if result < 0 {
            result = 1 << 8 + result
        }
        return String(result, radix: 2)
    }
    
    func reset() {
        stack.reset()
    }
    
}
