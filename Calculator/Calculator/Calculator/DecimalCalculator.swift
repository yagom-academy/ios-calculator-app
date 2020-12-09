//
//  DecimalCalculator.swift
//  Calculator
//
//  Created by Wonhee on 2020/12/08.
//

import Foundation

class DecimalCalculator: DecimalCalculable {
    static let shared: DecimalCalculator = DecimalCalculator()
    private init() {}
    
    private var decimalStack = Stack<DecimalData>()
    private let decimalOperator: [String] = DecimalOperatorType.allCases.map { $0.rawValue }
    
    func calculate(_ items: [String]) throws -> CalculatorData {
        // 후위표기식으로 바뀐 식 Array
        do {
            guard decimalStack.isEmpty else {
                throw CalculatorError.calculator
            }
            let postFixFormula = try putFormula(items).map({ data -> DecimalData in
                guard let decimalData = data as? DecimalData else {
                    throw CalculatorError.unknowned
                }
                return decimalData
            })
            for formula in postFixFormula {
                // 숫자
                guard let formulaType = formula.type else {
                    decimalStack.push(formula)
                    continue
                }
                guard let secondItem = decimalStack.pop(),
                      let firstItem = decimalStack.pop() else {
                    throw CalculatorError.calculator
                }
                switch formulaType {
                case .add:
                    try add(firstItem: firstItem, secondItem: secondItem)
                case .subtract:
                    try subtract(firstItem: firstItem, secondItem: secondItem)
                case .multiple:
                    try multiply(firstItem: firstItem, secondItem: secondItem)
                case .divide:
                    try divide(firstItem: firstItem, secondItem: secondItem)
                }
            }
            
            guard let resultData = decimalStack.pop() else {
                throw CalculatorError.calculator
            }
            return resultData
        } catch {
             throw error
        }
    }
    
    // 후위표기식으로 바꾸기
    // 우선순위가 높거나 같은 것들을 빼고 자신을 스택에 담음
    func putFormula(_ items: [String]) throws -> [CalculatorData] {
        var postFixFormula: [CalculatorData] = []
        for item in items {
            do {
                // 연산자일 경우
                if decimalOperator.contains(item) {
                    let operatorData = try getOperatorData(item)
                    while true {
                        // 스택이 비어 있을때
                        guard let compareOperatorData = decimalStack.peek() else {
                            decimalStack.push(operatorData)
                            break
                        }
                        guard let operatorType = operatorData.type,
                              let compareOperatorType = compareOperatorData.type,
                              operatorType.isPrecedence(compare: compareOperatorType) else {
                            decimalStack.push(operatorData)
                            break
                        }
                        postFixFormula.append(compareOperatorData)
                        decimalStack.pop()
                    }
                }
                // 숫자일 경우
                else {
                    postFixFormula.append(DecimalData(value: item, type: nil))
                }
            } catch {
                throw error
            }
        }
        while !decimalStack.isEmpty {
            guard let operatorData = decimalStack.pop() else {
                throw CalculatorError.unknowned
            }
            postFixFormula.append(operatorData)
        }
        
        return postFixFormula
    }
    
    func getOperatorData(_ item: String) throws -> DecimalData {
        guard let operatorType = DecimalOperatorType(rawValue: item) else {
            throw CalculatorError.unknowned
        }
        return DecimalData(value: item, type: operatorType)
    }
    
    func divide(firstItem: CalculatorData, secondItem: CalculatorData) throws {
        guard let firstNumber = Double(firstItem.value.decimalRemoveComma()),
              let secondNumber = Double(secondItem.value.decimalRemoveComma()) else {
            throw CalculatorError.unknowned
        }
        let resultNumber = firstNumber / secondNumber
        decimalStack.push(DecimalData(value: String(resultNumber), type: nil))
    }
    
    func add(firstItem: CalculatorData, secondItem: CalculatorData) throws {
        guard let firstNumber = Double(firstItem.value.decimalRemoveComma()),
              let secondNumber = Double(secondItem.value.decimalRemoveComma()) else {
            throw CalculatorError.unknowned
        }
        let resultNumber = firstNumber + secondNumber
        decimalStack.push(DecimalData(value: String(resultNumber), type: nil))
    }
    
    func subtract(firstItem: CalculatorData, secondItem: CalculatorData) throws {
        guard let firstNumber = Double(firstItem.value),
              let secondNumber = Double(secondItem.value) else {
            throw CalculatorError.unknowned
        }
        let resultNumber = firstNumber - secondNumber
        decimalStack.push(DecimalData(value: String(resultNumber), type: nil))
    }
    
    func multiply(firstItem: CalculatorData, secondItem: CalculatorData) throws {
        guard let firstNumber = Double(firstItem.value),
              let secondNumber = Double(secondItem.value) else {
            throw CalculatorError.unknowned
        }
        let resultNumber = firstNumber * secondNumber
        decimalStack.push(DecimalData(value: String(resultNumber), type: nil))
    }
    
    func clear() {
        decimalStack.removeAll()
    }
}
