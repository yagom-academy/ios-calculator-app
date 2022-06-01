//
//  CalculatorSignType.swift
//  Calculator
//
//  Created by Derrick kim on 2022/05/23.
//

import Foundation

enum CalculatorOtherSigns: String {
    case dot = "."
    case doubleZero = "00"
    case clearEntry = "CE"
    case allClear = "AC"
    case plusMinus = "⁺⁄₋"
    case result = "="
}

enum CalculatorState {
    case empty
    case zero
    case minus
    case nan
    
    var value: String {
        switch self {
        case .empty:
            return  ""
        case .zero:
            return "0"
        case .minus:
            return "-"
        case .nan:
            return "NaN"
        }
    }
}
