//
//  ButtonTextEnum.swift
//  Calculator
//
//  Created by Min Hyun on 2023/06/08.
//

typealias LableStatus = (operandValue: String, operatorValue: String)

enum MenuType: String, CaseIterable {
    case allClear = "AC"
    case clearEntry = "CE"
    case signToggle = "⁺⁄₋"
    
    func getLabelTexts(when status: LableStatus) -> LableStatus {
        switch self {
        case .allClear:
            return (operandValue: MultiUseString.zero.value,
                    operatorValue: MultiUseString.empty.value)
        case .clearEntry:
            return (operandValue: MultiUseString.zero.value,
                    operatorValue: status.operatorValue)
        case .signToggle:
            guard status.operandValue != MultiUseString.zero.value,
                  let operandNumber = Double(status.operandValue)
            else {
                return (operandValue: status.operandValue,
                        operatorValue: status.operatorValue)
            }
            let toggledNumber = OperandFormatter.formatDoubleToString(operandNumber * (-1))
            
            return (operandValue: toggledNumber,
                    operatorValue: status.operatorValue)
        }
    }
}

