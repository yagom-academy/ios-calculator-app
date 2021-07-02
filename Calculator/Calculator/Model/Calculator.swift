//
//  Calculator.swift
//  Calculator
//
//  Created by Sanchez, Hosinging, Soll on 2021/06/25.
//

import Foundation

// MARK: - Enumerations 타입 정의
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

// MARK: - Calculator 클래스 정의
class Calculator: Calculatable {
    
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
    
    // currentNumbers에 들어있는 배열을 합쳐 하나의 숫자로 만든다.
    func concatNumbers() -> String {
        let covertedNumber = currentNumbers.joined()
        return covertedNumber
    }
    
    // AC 버튼을 눌렀을 때 데이터들을 지워준다.
    func allClear() -> Int {
        infixNotation.removeAll()
        postfixNotation.removeAll()
        currentNumbers = initializedNumber
        let result = OperandAndOperatorStack.removeAll()
        return result
    }
    
    // CE 버튼을 눌렀을 때 currentNumbers의 데이터를 지워준다.
    func clearEntry() -> Int {
        userInput.removeAll()
        currentNumbers = initializedNumber
        return 0
    }
    
    // 중위연산자 배열에 값을 추가한다.
    func putInto(_ value: [String]) {
        infixNotation.append(contentsOf: value)
    }
    
    // 중위연산자 배열을 후위연산자 배열로 반환해준다.
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
    
    // String 타입의 파라미터가 Operator 타입인지 확인하여 Operator로 반환한다.
    func checkOperator(_ input: String) throws -> Operator {
        guard let acquiredOperator = Operator(rawValue: input) else { throw CalculatorError.unknown }
        return acquiredOperator
    }
    
    // 후위연산자 배열을 계산하여 결과값을 Double로 반환한다.
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
    
    // 연산자 버튼을 눌렀을 때 userInput 배열에 연산자를 추가한다.
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

// MARK: - Extension 정의
extension String {
    
    func toDouble() -> Bool {
        if let _ = Double(self) {
            return true
        }
        return false
    }
}

extension Calculatable {
    
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

// MARK: - Calculator Unit Test 함수
extension Calculator {
    
    func calculate(with str: [String]) -> Result<Double, CalculatorError> {
        putInto(str)
        let _ = try? converToPostfixNotation()
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
