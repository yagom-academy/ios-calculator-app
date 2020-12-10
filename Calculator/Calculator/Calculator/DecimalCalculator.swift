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
            guard let formulaType = formula.type else {
                decimalStack.push(formula)
                continue
            }
            guard let secondItem = decimalStack.pop(),
                  let firstItem = decimalStack.pop() else {
                throw CalculatorError.calculator
            }
            var resultData: CalculatorData
            switch formulaType {
            case .add:
                resultData = try add(firstItem: firstItem, secondItem: secondItem)
            case .subtract:
                resultData = try subtract(firstItem: firstItem, secondItem: secondItem)
            case .multiple:
                resultData = try multiply(firstItem: firstItem, secondItem: secondItem)
            case .divide:
                resultData = try divide(firstItem: firstItem, secondItem: secondItem)
            }
            guard let result = resultData as? DecimalData else {
                throw CalculatorError.calculator
            }
            decimalStack.push(result)
        }
        
        guard let calculatorResultData = decimalStack.pop() else {
            throw CalculatorError.calculator
        }
        return calculatorResultData
    }
    
    func putFormula(_ items: [String]) throws -> [CalculatorData] {
        var postFixFormula: [CalculatorData] = []
        for item in items {
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
            else {
                postFixFormula.append(DecimalData(value: item, type: nil))
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
    
    // TODO: VC에서 숫자 ,있는 상태로 받을지 결정 후 , remove 사용 확인하기
    func divide(firstItem: CalculatorData, secondItem: CalculatorData) throws -> CalculatorData {
        guard let firstNumber = Double(firstItem.value),
              let secondNumber = Double(secondItem.value) else {
            throw CalculatorError.unknowned
        }
        let resultNumber = firstNumber / secondNumber
        return DecimalData(value: String(resultNumber), type: nil)
    }
    
    func add(firstItem: CalculatorData, secondItem: CalculatorData) throws -> CalculatorData {
        guard let firstNumber = Double(firstItem.value),
              let secondNumber = Double(secondItem.value) else {
            throw CalculatorError.unknowned
        }
        let resultNumber = firstNumber + secondNumber
        return DecimalData(value: String(resultNumber), type: nil)
    }
    
    func subtract(firstItem: CalculatorData, secondItem: CalculatorData) throws -> CalculatorData {
        guard let firstNumber = Double(firstItem.value),
              let secondNumber = Double(secondItem.value) else {
            throw CalculatorError.unknowned
        }
        let resultNumber = firstNumber - secondNumber
        return DecimalData(value: String(resultNumber), type: nil)
    }
    
    func multiply(firstItem: CalculatorData, secondItem: CalculatorData) throws -> CalculatorData {
        guard let firstNumber = Double(firstItem.value),
              let secondNumber = Double(secondItem.value) else {
            throw CalculatorError.unknowned
        }
        let resultNumber = firstNumber * secondNumber
        return DecimalData(value: String(resultNumber), type: nil)
    }
    
    func clear() {
        decimalStack.removeAll()
    }
}
