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
    private let decimalOperator: [String] = DecimalOperatorType.allCases.map { decimalType -> String in
        return decimalType.rawValue
    }
    
    func calculate(_ items: [String]) throws -> CalculatorData {
        guard decimalStack.isEmpty else {
            throw CalculatorError.calculation
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
            let resultData = try choiceCalculation(operatorType: formulaType)
            guard let result = resultData as? DecimalData else {
                throw CalculatorError.calculation
            }
            decimalStack.push(result)
        }
        
        guard let calculatorResultData = decimalStack.pop() else {
            throw CalculatorError.calculation
        }
        return calculatorResultData
    }
    
    func putFormula(_ items: [String]) throws -> [CalculatorData] {
        var postFixFormula: [CalculatorData] = []
        for item in items {
            if decimalOperator.contains(item) {
                let operatorData = try getOperatorData(item)
                while !decimalStack.isEmpty {
                    guard let compareOperatorData = decimalStack.peek(),
                          let operatorType = operatorData.type,
                          let compareOperatorType = compareOperatorData.type,
                          operatorType.isPrecedence(compare: compareOperatorType) else {
                        break
                    }
                    postFixFormula.append(compareOperatorData)
                    decimalStack.pop()
                }
                decimalStack.push(operatorData)
            } else {
                postFixFormula.append(DecimalData(value: item, type: nil))
            }
        }
        for _ in 0..<decimalStack.size {
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
    
    func choiceCalculation(operatorType: DecimalOperatorType) throws -> CalculatorData {
        guard let secondItem = decimalStack.pop(),
              let firstItem = decimalStack.pop() else {
            throw CalculatorError.calculation
        }
        var resultData: CalculatorData
        switch operatorType {
        case .add:
            resultData = try add(firstItem: firstItem, secondItem: secondItem)
        case .subtract:
            resultData = try subtract(firstItem: firstItem, secondItem: secondItem)
        case .multiple:
            resultData = try multiply(firstItem: firstItem, secondItem: secondItem)
        case .divide:
            resultData = try divide(firstItem: firstItem, secondItem: secondItem)
        }
        
        return resultData
    }
    
    func stringToDouble(_ item: String) throws -> Double {
        guard let doubleItem = Double(item) else {
            throw CalculatorError.unknowned
        }
        return doubleItem
    }
    
    func divide(firstItem: CalculatorData, secondItem: CalculatorData) throws -> CalculatorData {
        let firstNumber = try stringToDouble(firstItem.value)
        let secondNumber = try stringToDouble(secondItem.value)
        let resultNumber = firstNumber / secondNumber
        return DecimalData(value: String(resultNumber), type: nil)
    }
    
    func add(firstItem: CalculatorData, secondItem: CalculatorData) throws -> CalculatorData {
        let firstNumber = try stringToDouble(firstItem.value)
        let secondNumber = try stringToDouble(secondItem.value)
        let resultNumber = firstNumber + secondNumber
        return DecimalData(value: String(resultNumber), type: nil)
    }
    
    func subtract(firstItem: CalculatorData, secondItem: CalculatorData) throws -> CalculatorData {
        let firstNumber = try stringToDouble(firstItem.value)
        let secondNumber = try stringToDouble(secondItem.value)
        let resultNumber = firstNumber - secondNumber
        return DecimalData(value: String(resultNumber), type: nil)
    }
    
    func multiply(firstItem: CalculatorData, secondItem: CalculatorData) throws -> CalculatorData {
        let firstNumber = try stringToDouble(firstItem.value)
        let secondNumber = try stringToDouble(secondItem.value)
        let resultNumber = firstNumber * secondNumber
        return DecimalData(value: String(resultNumber), type: nil)
    }
    
    func clear() {
        decimalStack.removeAll()
    }
}
