//
//  CalculatorItemNode.swift
//  Calculator
//
//  Created by Min Hyun on 2023/05/29.
//

class CalculatorItemNode {
    private(set) var value: CalculateItem
    private(set) var next: CalculatorItemNode?
    
    init(_ value: CalculateItem) {
        self.value = value
    }

    func changeNext(_ next: CalculatorItemNode?) {
        self.next = next
    }
    
    func castValueIntoOperator() throws -> OperatorType {
        guard let valueString = value as? String,
              let operatorType = OperatorType(rawValue: valueString)
        else {
            throw CalculatorError.invalidOperator
        }
        return operatorType
    }
    
    func castValueIntoDouble() throws -> Double {
        guard let valueDouble = value as? Double else {
            guard let valueInt = value as? Int else {
                throw CalculatorError.invalidInput
            }
            return Double(valueInt)
        }
        return valueDouble
    }
}
