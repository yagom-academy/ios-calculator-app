//
//  ButtonTextEnum.swift
//  Calculator
//
//  Created by Min Hyun on 2023/06/08.
//

typealias LabelValues = (operandValue: String, operatorValue: String)

enum ButtonType {
    case allClear
    case clearEntry
    case signToggle
    case equal
    case dot
    case doubleZero
    case operators
    case numbers
    
    static func getType(_ button: String) -> ButtonType {
        let operators: [String] = Operator.allCases.map { String($0.rawValue) }
        
        switch button {
        case CalculatorNamespace.AllClear:
            return .allClear
        case CalculatorNamespace.ClearEntry:
            return .clearEntry
        case CalculatorNamespace.SignToggle:
            return .signToggle
        case CalculatorNamespace.Equal:
            return .equal
        case CalculatorNamespace.Dot:
            return .dot
        case CalculatorNamespace.DoubleZero:
            return .doubleZero
        default:
            if operators.contains(button) {
                return .operators
            }
            return .numbers
        }
    }
}
