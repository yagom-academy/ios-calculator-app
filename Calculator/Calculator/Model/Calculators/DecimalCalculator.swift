//
//  Calculator.swift
//  Calculator
//
//  Created by 김찬우 on 2021/03/30.
//

import Foundation

struct DecimalCalculator: Addable, Subtractable, TypeConvertible, MaximumDigitLimitable {
    typealias T = Double
    var stack = Stack<Double>()
    var maximumDigit: Double = pow(10, 10)
    
    func divide(_ operatedNumber: Double, by operatingNumber: Double) throws -> Double {
        if operatingNumber != 0 {
            return operatedNumber / operatingNumber
        }
        throw DecimalCalculatorError.divisionByZero
    }
    
    func multiply(_ operatedNumber: Double, by operatingNumber: Double) -> Double {
        return operatedNumber * operatingNumber
    } 
    
    func convertType(inputNumber: String?) throws -> Double {
        guard let number = inputNumber else { throw
            DecimalCalculatorError.nilInputFoundWhileConvertingTypeOfNumber
        }
        guard let userInputNumber = Double(number) else { throw
            DecimalCalculatorError.notDoubleNumber
        }
        return userInputNumber
    }
    
    func convertType(inputOperator: String?) throws -> Operator {
        guard let userInputOperator = inputOperator else { throw DecimalCalculatorError.nilInputFoundWhileConvertingTypeOfOperator }
        switch userInputOperator {
        case "+":
            return Operator.addition
        case "-":
            return Operator.subtraction
        case "*":
            return Operator.multiplication
        case "/":
            return Operator.division
        default:
            throw DecimalCalculatorError.notAvailableOperator
        }
    }
    
    mutating func calculate(operateSign: String?, operatedNumber: Double, operatingNumber: Double) throws -> Double {
        switch try convertType(inputOperator: operateSign) {
        case .addition:
            return add(operatedNumber, and: operatingNumber).truncatingRemainder(dividingBy: maximumDigit)
        case .subtraction:
            return subtract(operatedNumber, and: operatingNumber).truncatingRemainder(dividingBy: maximumDigit)
        case .multiplication:
            return multiply(operatedNumber, by: operatingNumber).truncatingRemainder(dividingBy: maximumDigit)
        case .division:
            return try divide(operatedNumber, by: operatingNumber).truncatingRemainder(dividingBy: maximumDigit)
        default:
            throw DecimalCalculatorError.cannotCalculate
        }
    }
    
    func returnTopOfStack() throws -> Double {
        if try stack.top() / maximumDigit >= 1 {
            return try stack.top().truncatingRemainder(dividingBy: maximumDigit) 
        } else {
            return try stack.top()
        }
    }
    
    mutating func executeOperate(of inputNumber: String?) {
        do {
            try stack.push(convertType(inputNumber: inputNumber))
            
            for _ in 1...10 {
                stack.push(try calculate(operateSign: readLine(), operatedNumber: stack.pop(), operatingNumber: convertType(inputNumber: readLine())))
                print(try returnTopOfStack())
            }
        } catch {
            print(error)
        }
    }
}



