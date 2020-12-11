//
//  BinaryCalculator.swift
//  Calculator
//
//  Created by Wonhee on 2020/12/08.
//

import Foundation

class BinaryCalculator: BinaryCalculable {
    
    static let shared: BinaryCalculator = BinaryCalculator()
    private init() {}

    private var binaryStack = Stack<BinaryData>()
    private let binaryOperator: [String] = BinaryOperatorType.allCases.map { binaryType -> String in
        return binaryType.rawValue
    }
    private let binaryScale = 2

    func calculate(_ items: [String]) throws -> CalculatorData {
        guard binaryStack.isEmpty else {
            throw CalculatorError.calculation
        }
        let postFixFormula = try putFormula(items).map({ data -> BinaryData in
            guard let binaryData = data as? BinaryData else {
                throw CalculatorError.unknowned
            }
            return binaryData
        })
        for formula in postFixFormula {
            guard let formulaType = formula.type else {
                binaryStack.push(formula)
                continue
            }
            let resultData = try choiceCalculation(operatorType: formulaType)
            guard let result = resultData as? BinaryData else {
                throw CalculatorError.calculation
            }
            binaryStack.push(result)
        }
        
        guard let calculatorResultData = binaryStack.pop() else {
            throw CalculatorError.calculation
        }
        return calculatorResultData
    }

    func putFormula(_ items: [String]) throws -> [CalculatorData] {
        var postFixFormula: [CalculatorData] = []
        for item in items {
            if binaryOperator.contains(item) {
                let operatorData = try getOperatorData(item)
                while !binaryStack.isEmpty {
                    guard let compareOperatorData = binaryStack.peek(),
                          let operatorType = operatorData.type,
                          let compareOperatorType = compareOperatorData.type,
                          operatorType.isPrecedence(compare: compareOperatorType) else {
                        break
                    }
                    postFixFormula.append(compareOperatorData)
                    binaryStack.pop()
                }
                binaryStack.push(operatorData)
            }
            else {
                postFixFormula.append(BinaryData(value: item, type: nil))
            }
        }
        for _ in 0..<binaryStack.size {
            guard let operatorData = binaryStack.pop() else {
                throw CalculatorError.unknowned
            }
            postFixFormula.append(operatorData)
        }
        return postFixFormula
    }

    func getOperatorData(_ item: String) throws -> BinaryData {
        guard let operatorType = BinaryOperatorType(rawValue: item) else {
            throw CalculatorError.unknowned
        }
        return BinaryData(value: item, type: operatorType)
    }
    
    func choiceCalculation(operatorType: BinaryOperatorType) throws -> CalculatorData {
        var resultData: CalculatorData? = nil
        switch operatorType {
        case .leftShift, .rightShift, .not:
            guard let item = binaryStack.pop() else {
                throw CalculatorError.calculation
            }
            if operatorType == .leftShift {
                resultData = try leftShift(item)
            }
            else if operatorType == .rightShift {
                resultData = try rightShift(item)
            }
            else if operatorType == .not {
                resultData = try not(item)
            }
        default:
            guard let secondItem = binaryStack.pop(),
                  let firstItem = binaryStack.pop() else {
                throw CalculatorError.calculation
            }
            if operatorType == .add {
                resultData = try add(firstItem: firstItem, secondItem: secondItem)
            }
            else if operatorType == .subtract {
                resultData = try subtract(firstItem: firstItem, secondItem: secondItem)
            }
            else if operatorType == .and {
                resultData = try and(firstItem: firstItem, secondItem: secondItem)
            }
            else if operatorType == .nand {
                resultData = try nand(firstItem: firstItem, secondItem: secondItem)
            }
            else if operatorType == .or {
                resultData = try or(firstItem: firstItem, secondItem: secondItem)
            }
            else if operatorType == .nor {
                resultData = try nor(firstItem: firstItem, secondItem: secondItem)
            }
            else if operatorType == .xor {
                resultData = try xor(firstItem: firstItem, secondItem: secondItem)
            }
        }
        guard let result = resultData else {
            throw CalculatorError.calculation
        }
        return result
    }
    
    func stringToInt(_ item: String) throws -> Int {
        guard let intItem = Int(item, radix: binaryScale) else {
            throw CalculatorError.unknowned
        }
        return intItem
    }

    func and(firstItem: CalculatorData, secondItem: CalculatorData) throws -> CalculatorData {
        let firstValue = try stringToInt(firstItem.value)
        let secondValue = try stringToInt(secondItem.value)
        let resultValue = firstValue & secondValue
        return BinaryData(value: String(resultValue, radix: binaryScale), type: nil)
    }
    
    func nand(firstItem: CalculatorData, secondItem: CalculatorData) throws -> CalculatorData {
        let andData = try and(firstItem: firstItem, secondItem: secondItem)
        let nandData = try not(andData)
        return nandData
    }

    func or(firstItem: CalculatorData, secondItem: CalculatorData) throws -> CalculatorData {
        let firstValue = try stringToInt(firstItem.value)
        let secondValue = try stringToInt(secondItem.value)
        let resultValue = firstValue | secondValue
        return BinaryData(value: String(resultValue, radix: binaryScale), type: nil)
    }

    func nor(firstItem: CalculatorData, secondItem: CalculatorData) throws -> CalculatorData {
        let orData = try or(firstItem: firstItem, secondItem: secondItem)
        let norData = try not(orData)
        return norData
    }
    
    func xor(firstItem: CalculatorData, secondItem: CalculatorData) throws -> CalculatorData {
        let firstValue = try stringToInt(firstItem.value)
        let secondValue = try stringToInt(secondItem.value)
        let resultValue = firstValue ^ secondValue
        return BinaryData(value: String(resultValue, radix: binaryScale), type: nil)
    }
    
    func add(firstItem: CalculatorData, secondItem: CalculatorData) throws -> CalculatorData {
        let firstValue = try stringToInt(firstItem.value)
        let secondValue = try stringToInt(secondItem.value)
        let resultValue = firstValue + secondValue
        return BinaryData(value: String(resultValue, radix: binaryScale), type: nil)
    }

    func subtract(firstItem: CalculatorData, secondItem: CalculatorData) throws -> CalculatorData {
        let firstValue = try stringToInt(firstItem.value)
        let secondValue = try stringToInt(secondItem.value)
        let resultValue = firstValue - secondValue
        return BinaryData(value: String(resultValue, radix: binaryScale), type: nil)
    }
    
    func not(_ item: CalculatorData) throws -> CalculatorData {
        let itemValue = try stringToInt(item.value)
        let resultValue = ~itemValue
        return BinaryData(value: String(resultValue, radix: binaryScale), type: nil)
    }

    func leftShift(_ item: CalculatorData) throws -> CalculatorData {
        let itemValue = try stringToInt(item.value)
        let resultValue = itemValue << 1
        return BinaryData(value: String(resultValue, radix: 2), type: nil)
    }

    func rightShift(_ item: CalculatorData) throws -> CalculatorData {
        let itemValue = try stringToInt(item.value)
        let resultValue = itemValue >> 1
        return BinaryData(value: String(resultValue, radix: binaryScale), type: nil)
    }

    func clear() {
        binaryStack.removeAll()
    }
}
