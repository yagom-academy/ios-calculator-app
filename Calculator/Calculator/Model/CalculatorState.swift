//
//  CalculatorState.swift
//  Calculator
//
//  Created by Derrick kim on 2022/06/04.
//

import Foundation

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
