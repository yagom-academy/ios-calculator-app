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
    private let binaryOperator: [String] = BinaryOperatorType.allCases.map { $0.rawValue }
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
            
            var resultData: CalculatorData? = nil
            switch formulaType {
            case .leftShift, .rightShift, .not:
                guard let item = binaryStack.pop() else {
                    throw CalculatorError.calculation
                }
                if formulaType == .leftShift {
                    resultData = try leftShift(item)
                }
                else if formulaType == .rightShift {
                    resultData = try rightShift(item)
                }
                else if formulaType == .not {
                    resultData = try not(item)
                }
            default:
                guard let secondItem = binaryStack.pop(),
                      let firstItem = binaryStack.pop() else {
                    throw CalculatorError.calculation
                }
                if formulaType == .add {
                    resultData = try add(firstItem: firstItem, secondItem: secondItem)
                }
                else if formulaType == .subtract {
                    resultData = try subtract(firstItem: firstItem, secondItem: secondItem)
                }
                else if formulaType == .and {
                    resultData = try and(firstItem: firstItem, secondItem: secondItem)
                }
                else if formulaType == .nand {
                    resultData = try nand(firstItem: firstItem, secondItem: secondItem)
                }
                else if formulaType == .or {
                    resultData = try or(firstItem: firstItem, secondItem: secondItem)
                }
                else if formulaType == .nor {
                    resultData = try nor(firstItem: firstItem, secondItem: secondItem)
                }
                else if formulaType == .xor {
                    resultData = try xor(firstItem: firstItem, secondItem: secondItem)
                }
            }
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
                while true {
                    guard let compareOperatorData = binaryStack.peek() else {
                        binaryStack.push(operatorData)
                        break
                    }
                    guard let operatorType = operatorData.type,
                          let compareOperatorType = compareOperatorData.type,
                          operatorType.isPrecedence(compare: compareOperatorType) else {
                        binaryStack.push(operatorData)
                        break
                    }
                    postFixFormula.append(compareOperatorData)
                    binaryStack.pop()
                }
            }
            else {
                postFixFormula.append(BinaryData(value: item, type: nil))
            }
        }
        while !binaryStack.isEmpty {
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

    func and(firstItem: CalculatorData, secondItem: CalculatorData) throws -> CalculatorData {
        guard let firstValue = Int(firstItem.value, radix: binaryScale),
              let secondValue = Int(secondItem.value, radix: binaryScale) else {
            throw CalculatorError.unknowned
        }
        let resultValue = firstValue & secondValue
        return BinaryData(value: String(resultValue, radix: binaryScale), type: nil)
    }

    func or(firstItem: CalculatorData, secondItem: CalculatorData) throws -> CalculatorData {
        guard let firstValue = Int(firstItem.value, radix: binaryScale),
              let secondValue = Int(secondItem.value, radix: binaryScale) else {
            throw CalculatorError.unknowned
        }
        let resultValue = firstValue | secondValue
        return BinaryData(value: String(resultValue, radix: binaryScale), type: nil)
    }

    func xor(firstItem: CalculatorData, secondItem: CalculatorData) throws -> CalculatorData {
        guard let firstValue = Int(firstItem.value, radix: binaryScale),
              let secondValue = Int(secondItem.value, radix: binaryScale) else {
            throw CalculatorError.unknowned
        }
        let resultValue = firstValue ^ secondValue
        return BinaryData(value: String(resultValue, radix: binaryScale), type: nil)
    }

    func nor(firstItem: CalculatorData, secondItem: CalculatorData) throws -> CalculatorData {
        let orData = try or(firstItem: firstItem, secondItem: secondItem)
        return try not(orData)
    }

    func nand(firstItem: CalculatorData, secondItem: CalculatorData) throws -> CalculatorData {
        let andData = try and(firstItem: firstItem, secondItem: secondItem)
        return try not(andData)
    }
    
    func add(firstItem: CalculatorData, secondItem: CalculatorData) throws -> CalculatorData {
        guard let firstValue = Int(firstItem.value, radix: binaryScale),
              let secondValue = Int(secondItem.value, radix: binaryScale) else {
            throw CalculatorError.unknowned
        }
        let resultValue = firstValue + secondValue
        return BinaryData(value: String(resultValue, radix: binaryScale), type: nil)
    }

    func subtract(firstItem: CalculatorData, secondItem: CalculatorData) throws -> CalculatorData {
        guard let firstValue = Int(firstItem.value, radix: binaryScale),
              let secondValue = Int(secondItem.value, radix: binaryScale) else {
            throw CalculatorError.unknowned
        }
        let resultValue = firstValue - secondValue
        return BinaryData(value: String(resultValue, radix: binaryScale), type: nil)
    }
    
    func not(_ item: CalculatorData) throws -> CalculatorData {
        guard let itemValue = Int(item.value, radix: binaryScale) else {
            throw CalculatorError.unknowned
        }
        let resultValue = ~itemValue
        return BinaryData(value: String(resultValue, radix: binaryScale), type: nil)
    }

    func leftShift(_ item: CalculatorData) throws -> CalculatorData {
        guard let itemValue = Int(item.value, radix: binaryScale) else {
            throw CalculatorError.unknowned
        }
        let resultValue = itemValue << 1
        return BinaryData(value: String(resultValue, radix: 2), type: nil)
    }

    func rightShift(_ item: CalculatorData) throws -> CalculatorData {
        guard let itemValue = Int(item.value, radix: binaryScale) else {
            throw CalculatorError.unknowned
        }
        let resultValue = itemValue >> 1
        return BinaryData(value: String(resultValue, radix: binaryScale), type: nil)
    }

    func clear() {
        binaryStack.removeAll()
    }
}
