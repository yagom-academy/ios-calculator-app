//
//  OperatorConvertible.swift
//  Calculator
//
//  Created by JINHONG AN on 2021/06/28.
//

import Foundation

protocol OperatorConvertible {
    static func obtainOperator(from target: String) throws -> Operator
}

extension OperatorConvertible {
    static func obtainOperator(from target: String) throws -> Operator {
        guard let operatorSymbol = Operator(rawValue: target) else {
            throw CalculatorError.invalidOperator
        }
        return operatorSymbol
    }
}
