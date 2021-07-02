//
//  Calculator.swift
//  Calculator
//
//  Created by Sanchez, Hosinging, Soll on 2021/06/25.
//

import Foundation

enum Operator: String, CaseIterable {
    
    case plus = "+"
    case minus = "-"
    case multiplication = "*"
    case division = "/"
    
    fileprivate var priority: Int {
        switch self {
        case .plus, .minus:
            return OperatorPriority.low.rawValue
        case .multiplication, .division:
            return OperatorPriority.high.rawValue
        }
    }
    
    static func < (lhs: Operator, rhs: Operator) -> Bool {
        lhs.priority < rhs.priority
    }
    
}

enum OperatorPriority: Int {
    
    case low = 0
    case high = 1
}

enum CalculatorError: Error {
    
    case unknown
    case dividedByZero
}

extension String {
    
    func toDouble() -> Bool {
        if let _ = Double(self) {
            return true
        }
        return false
    }
}

class Calculator {
    
    private var infixNotation = [String]()
    private var postfixNotation = [String]()
    private var OperandAndOperatorStack = Stack<String>()
    var userInput = [String]()
    let initializedNumber: [String] = ["0"]
    var currentNumbers: [String]
    var currentOperatorCheck: String = "0"
    
    init() {
        self.currentNumbers = initializedNumber
    }
    
    func concatNumbers() -> String {
        let covertedNumber = currentNumbers.joined()
        return covertedNumber
    }
    
    func allClear() -> Int {
        infixNotation.removeAll()
        postfixNotation.removeAll()
        currentNumbers = initializedNumber
        let result = OperandAndOperatorStack.removeAll()
        return result
    }
    
    func clearEntry() -> Int {
        userInput.removeAll()
        currentNumbers = initializedNumber
        return 0
    }
    
    func putInto(_ value: [String]) {
        infixNotation.append(contentsOf: value)
    }
    
    func converToPostfixNotation() throws -> [String] {
        itemsLoop: for item in infixNotation {
            if item.toDouble() {
                postfixNotation.append(item)
                continue itemsLoop
            }
            if OperandAndOperatorStack.isEmpty {
                OperandAndOperatorStack.push(item)
                continue itemsLoop
            }
            
            guard let topOfStack = OperandAndOperatorStack.top else { throw CalculatorError.unknown }
            guard let currentOperator = try? checkOperator(item) else { throw CalculatorError.unknown }
            guard let stackOperator = try? checkOperator(topOfStack) else { throw CalculatorError.unknown }
            
            if stackOperator.priority >= currentOperator.priority {
                guard let poppedValue = OperandAndOperatorStack.pop() else { throw CalculatorError.unknown }
                postfixNotation.append(poppedValue)
                OperandAndOperatorStack.push(item)
            } else {
                OperandAndOperatorStack.push(item)
            }
            
        }
        while OperandAndOperatorStack.isEmpty == false {
            guard let topOfStack = OperandAndOperatorStack.pop() else { throw CalculatorError.unknown }
            postfixNotation.append(topOfStack)
        }
        return postfixNotation
    }
    
    func checkOperator(_ input: String) throws -> Operator {
        guard let acquiredOperator = Operator(rawValue: input) else { throw CalculatorError.unknown }
        return acquiredOperator
    }
    
    func calculatePostfix() throws -> Double {
        for item in postfixNotation {
            if item.toDouble() {
                OperandAndOperatorStack.push(item)
            } else {
                guard let firstElement = OperandAndOperatorStack.pop(), let secondElement = OperandAndOperatorStack.pop() else { throw CalculatorError.unknown }
                guard let firstOperand = Double(firstElement),
                      let secondOperand = Double(secondElement) else { throw CalculatorError.unknown }
                
                let acquiredOperator = try? checkOperator(item)
                
                switch acquiredOperator {
                case .plus:
                    OperandAndOperatorStack.push(String(add(firstOperand, secondOperand)))
                case .minus:
                    OperandAndOperatorStack.push(String(substract(secondOperand, firstOperand)))
                case .multiplication:
                    OperandAndOperatorStack.push(String(multiply(firstOperand, secondOperand)))
                case .division:
                    let result = try divide(secondOperand, firstOperand)
                    OperandAndOperatorStack.push(String(result))
                default:
                    throw CalculatorError.unknown
                }
            }
        }
        guard let lastElement = OperandAndOperatorStack.pop(), let result = Double(lastElement) else {
            throw CalculatorError.unknown
        }
        return result
    }
    
    func inputOperator(_ currentOperator: String) {
        var isAvailableAddingOperator = [Bool]()
        for item in Operator.allCases {
            if currentOperatorCheck != item.rawValue {
                isAvailableAddingOperator.append(true)
            } else {
                isAvailableAddingOperator.append(false)
            }
        }
        if isAvailableAddingOperator.filter({!$0}).isEmpty {
            userInput.append(concatNumbers())
            currentNumbers = initializedNumber
            currentOperatorCheck = currentOperator
            userInput.append(currentOperator)
        } else {
            currentOperatorCheck = currentOperator
            userInput.removeLast()
            userInput.append(currentOperator)
        }
        print(userInput)
    }
}

extension Calculator: Calculatable {
    
    func add(_ firstOperand: Double, _ secondOperand: Double) -> Double {
        return firstOperand + secondOperand
    }
    
    func substract(_ firstOperand: Double, _ secondOperand: Double) -> Double {
        return firstOperand - secondOperand
    }
    
    func multiply(_ firstOperand: Double, _ secondOperand: Double) -> Double {
        return firstOperand * secondOperand
    }
    
    func divide(_ firstOperand: Double, _ secondOperand: Double) throws -> Double {
        if secondOperand == 0 {
            throw CalculatorError.dividedByZero
        }
        return firstOperand / secondOperand
    }
}

extension Calculator {
    func formattingNumber(value: Double) -> Double {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 5
        numberFormatter.roundingMode = .halfUp
        guard let result = numberFormatter.string(for: value), let doubleValue = Double(result) else {
            return 0.0
        }
        return doubleValue
    }
}

// Todo +- 변환 함수
//extension Calculator {
//    func togglePositiveNegative() {
//        if numbers =
//    }
//}

// MARK: - Calculator Unit Test 함수
extension Calculator {
    func calculate(with str: [String]) -> Result<Double, CalculatorError> {
        putInto(str)
        try? converToPostfixNotation()
        guard let result = try? calculatePostfix() else {
            return .failure(.dividedByZero)
        }
        return .success(formattingNumber(value:result))
    }
}

//MARK: - 테스트를 위한 메인함수
//func main() {
//    
//    let c = Calculator()
//    let a = try? c.converToPostfixNotation()
//    print(a)
//    let d = try? c.calculatePostfix()
//    print(d)
//}
