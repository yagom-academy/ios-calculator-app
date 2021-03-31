//
//  DecimalCalculator.swift
//
//  Created by 윤재웅 on 2021/03/30.
//

import Foundation


final class DecimalCalculator: Calculatable {
    private var lowOperatorStack = Stack<DecimalOperatorType>()
    private var highOperatorStack = Stack<DecimalOperatorType>()
    private var operandStack = Stack<Double>()
    private var operand = CalculatorConstant.blank
    private var outputValue = CalculatorConstant.doubleZero
    private let operators = DecimalOperatorType.allCases.map { $0.description }
    private var preOperand: Double?
    private var preOperator: DecimalOperatorType?
    private var isEqual = false
    private var isFirstEquals = false
    private var isLastEquals = false
    private var ismidleEquls = false
    
    func input(_ inputValue: String) {
        if operators.contains(inputValue) == false {
            operand += inputValue
        } else if inputValue == DecimalOperatorType.equal.description {
            if isEqual == true {
                calculate(currentOperator: inputValue)
                return
            }
            isEqual = true
            moveToOperandStack(operand)
            calculate(currentOperator: inputValue)
        } else if inputValue == resetType.reset {
            reset()
            return
        } else {
            isEqual = false
            moveToOperandStack(operand)
            operand = CalculatorConstant.blank
            preOperator = DecimalOperatorType(rawValue: inputValue)
            if moveToOperatorStack(inputValue) == false {
                calculate(currentOperator: inputValue)
            } else {
                return
            }
        }
    }
    
    func calculate(currentOperator: String) {
        guard let currentOperatorValue = DecimalOperatorType(rawValue: currentOperator)?.rawValue,
              let operatiorPriority = DecimalOperatorType(rawValue: currentOperator)?.priority else {
            return
        }
        
        if currentOperator == DecimalOperatorType.equal.rawValue { // "=",
            if lowOperatorStack.count + highOperatorStack.count == 2 && operandStack.count == 1 && isLastEquals == false {
                if isFirstEquals == false {
                    isFirstEquals = true
                    preOperand = operandStack.peek!
                }
                guard var singleValue = operandStack.pop() else {
                    return
                }
                switch preOperator {
                case .add:
                    singleValue += preOperand!
                    print(convertInteger(value: String(singleValue)))
                    operandStack.push(singleValue)
                case .subtract:
                    singleValue += preOperand!
                    print(convertInteger(value: String(singleValue)))
                    operandStack.push(singleValue)
                case .multiple:
                    singleValue *= preOperand!
                    print(convertInteger(value: String(singleValue)))
                    operandStack.push(singleValue)
                case .divide:
                    singleValue /= preOperand!
                    print(convertInteger(value: String(singleValue)))
                    operandStack.push(singleValue)
                    
                default:
                    fatalError()
                }
                return
            } else if lowOperatorStack.count + highOperatorStack.count == 2 && operandStack.count == 2 && ismidleEquls == false {
                if isLastEquals == false {
                    isLastEquals = true
                    guard let fakelastValue = operandStack.peek else {
                        return
                    }
                    operandStack.push(fakelastValue)
                    guard let lastOperator = highOperatorStack.pop(), let value = pickCalulation(operatorType: lastOperator) else {
                        return
                    }
                    
                    operandStack.push(value)
                    guard let lastOperatorValue = lowOperatorStack.pop(), let lastValue = pickCalulation(operatorType: lastOperatorValue) else {
                        return
                    }
                    preOperand = fakelastValue
                    preOperator = lastOperator
                    print(convertInteger(value: String(lastValue)))
                    operandStack.push(lastValue)
                    return
                }
                
            } else if lowOperatorStack.count + highOperatorStack.count == 0 && operandStack.count == 1 && ismidleEquls == false {
                guard var singleValue = operandStack.pop() else {
                    return
                }
                switch preOperator {
                case .add:
                    singleValue += preOperand!
                    print(convertInteger(value: String(singleValue)))
                    operandStack.push(singleValue)
                case .subtract:
                    singleValue += preOperand!
                    print(convertInteger(value: String(singleValue)))
                    operandStack.push(singleValue)
                case .multiple:
                    singleValue *= preOperand!
                    print(convertInteger(value: String(singleValue)))
                    operandStack.push(singleValue)
                case .divide:
                    singleValue /= preOperand!
                    print(convertInteger(value: String(singleValue)))
                    operandStack.push(singleValue)
                    
                default:
                    fatalError()
                }
                return
            } else if lowOperatorStack.count + highOperatorStack.count == 1 && operandStack.count == 1 {
                if ismidleEquls == false {
                    ismidleEquls = true
                    guard let operandValue = operandStack.peek else {
                        return
                    }
                    preOperand = operandValue
                    
                    if highOperatorStack.isEmpty == true {
                        guard let operatorValue = lowOperatorStack.peek else {
                            return
                        }
                        preOperator = operatorValue
                    } else {
                        guard let operatorValue = highOperatorStack.peek else {
                            return
                        }
                        preOperator = operatorValue
                    }
                }
                guard var singleValue = operandStack.pop() else {
                    return
                }
                
                switch preOperator {
                case .add:
                    singleValue += preOperand!
                    print(convertInteger(value: String(singleValue)))
                    operandStack.push(singleValue)
                case .subtract:
                    singleValue += preOperand!
                    print(convertInteger(value: String(singleValue)))
                    operandStack.push(singleValue)
                case .multiple:
                    singleValue *= preOperand!
                    print(convertInteger(value: String(singleValue)))
                    operandStack.push(singleValue)
                case .divide:
                    singleValue /= preOperand!
                    print(convertInteger(value: String(singleValue)))
                    operandStack.push(singleValue)
                    
                default:
                    fatalError()
                }
                return
            }
            
            if currentOperator == DecimalOperatorType.equal.rawValue {
                if lowOperatorStack.isEmpty == true && highOperatorStack.isEmpty == false {
                    guard let OperatiorValue = highOperatorStack.pop(),
                          let result = pickCalulation(operatorType: OperatiorValue) else {
                        return
                    }
                    print(convertInteger(value: String(result)))
                } else if lowOperatorStack.isEmpty == false && highOperatorStack.isEmpty == true {
                    guard let OperatiorValue = lowOperatorStack.pop(),
                          let result = pickCalulation(operatorType: OperatiorValue) else {
                        return
                    }
                    print(convertInteger(value: String(result)))
                } else if lowOperatorStack.isEmpty == false && highOperatorStack.isEmpty == false {
                    guard let OperatiorValue = highOperatorStack.pop(),
                          let result = pickCalulation(operatorType: OperatiorValue) else {
                        return
                    }
                    operandStack.push(result)
                    guard let preOperatiorValue = lowOperatorStack.pop(),
                          let totalResult = pickCalulation(operatorType: preOperatiorValue) else {
                        return
                    }
                    print(convertInteger(value: String(totalResult)))
                    operandStack.push(totalResult)
                }
            }
        }
        else {
            if operatiorPriority == true { // high
                guard let highOperatiorValue = highOperatorStack.pop(),
                      let result = pickCalulation(operatorType: highOperatiorValue) else {
                    
                    return
                }
                print(convertInteger(value: String(result)))
                operandStack.push(result)
            } else { // low
                if operandStack.count < 3 {
                    guard let currentOperatorValue = DecimalOperatorType(rawValue: currentOperator) else {
                        return
                    }
                    if highOperatorStack.isEmpty == true {
                        guard let lowOperatiorValue = lowOperatorStack.pop(),
                              let result = pickCalulation(operatorType: lowOperatiorValue) else {
                            return
                        }
                        print(convertInteger(value: String(result)))
                        lowOperatorStack.push(currentOperatorValue)
                        operandStack.push(result)
                    } else {
                        guard let highOperatiorValue = highOperatorStack.pop(),
                              let result = pickCalulation(operatorType: highOperatiorValue) else {
                            return
                        }
                        print(convertInteger(value: String(result)))
                        lowOperatorStack.push(currentOperatorValue)
                        operandStack.push(result)
                    }
                    return
                }
                
                guard let lowOperatiorValue = highOperatorStack.pop(),
                      let result = pickCalulation(operatorType: lowOperatiorValue) else {
                    return
                }
                operandStack.push(result)
                
                guard let currentOperatorValue = DecimalOperatorType(rawValue: currentOperator),
                      let totalReuslt = pickCalulation(operatorType: currentOperatorValue) else {
                    return
                }
                print(convertInteger(value: String(totalReuslt)))
                operandStack.push(totalReuslt)
                lowOperatorStack.push(currentOperatorValue)
            }
            
            operatiorPriority == true ? highOperatorStack.push(DecimalOperatorType(rawValue: currentOperatorValue)!) : lowOperatorStack.push(DecimalOperatorType(rawValue: currentOperatorValue)!)
        }
    }
    
    func output() {
        
    }
    
    func reset() {
        lowOperatorStack.reset()
        highOperatorStack.reset()
        operand = CalculatorConstant.blank
    }
    
    private func pickCalulation(operatorType: DecimalOperatorType) -> Double? {
        guard let second = operandStack.pop(), let first = operandStack.pop() else { fatalError() }
        switch operatorType {
        case .add:
            return Double(add(first: first, second: second))
        case .subtract:
            return Double(subtract(first: first, second: second))
        case .multiple:
            return Double(multiple(first: first, second: second))
        case .divide:
            return Double(divide(first: first, second: second))
        default:
            fatalError()
        }
    }
    
    // MARK: - Operation
    private func add(first: Double, second: Double) -> String {
        return String(first + second)
    }
    
    private func subtract(first: Double, second: Double) -> String {
        return String(first - second)
    }
    
    private func multiple(first: Double, second: Double) -> String {
        return String(first * second)
    }
    
    private func divide(first: Double, second: Double) -> String {
        if second == 0 {
            fatalError()
        }
        return String(first / second)
    }
    
    // MARK: - Divide Integer, Primes
    private func convertInteger(value: String) -> String {
        let integerPrimes = value.components(separatedBy: ".")
        guard let primeNumber = integerPrimes.last,
              let integerNumber = integerPrimes.first else {
            
            return value
        }
        if primeNumber.count == CalculatorConstant.integerOne && primeNumber == CalculatorConstant.stringZero {
            return integerNumber
        } else {
            return value
        }
    }
    
    // MARK: - Move Stack
    private func moveToOperandStack(_ value: String) {
        guard let numberValue = Double(value) else {
            return
        }
        operandStack.push(numberValue)
    }
    
    private func moveToOperatorStack(_ operatorValue: String) -> Bool {
        guard let operatorType = DecimalOperatorType(rawValue: operatorValue) else {
            fatalError()
        }
        switch operatorType {
        case .add, .subtract :
            return pushLowPriority(operatorType)
        case .multiple, .divide :
            return pushHighPriority(operatorType)
        case .equal:
            return false
        }
    }
    
    // MARK: - Priority
    private func pushLowPriority(_ opertaorValue: DecimalOperatorType) -> Bool {
        if lowOperatorStack.isEmpty && highOperatorStack.isEmpty {
            lowOperatorStack.push(opertaorValue)
            return true
        } else if lowOperatorStack.isEmpty == false && highOperatorStack.isEmpty == true {
            return false
        } else if lowOperatorStack.isEmpty == true && highOperatorStack.isEmpty == false {
            return false
        } else {
            return false
        }
    }
    
    private func pushHighPriority(_ opertaorValue: DecimalOperatorType) -> Bool {
        if lowOperatorStack.isEmpty && highOperatorStack.isEmpty {
            highOperatorStack.push(opertaorValue)
            return true
        } else if lowOperatorStack.isEmpty == false && highOperatorStack.isEmpty == true {
            highOperatorStack.push(opertaorValue)
            return true
        } else if lowOperatorStack.isEmpty == true && highOperatorStack.isEmpty == false {
            return false
        } else {
            return false
        }
    }
    
}
