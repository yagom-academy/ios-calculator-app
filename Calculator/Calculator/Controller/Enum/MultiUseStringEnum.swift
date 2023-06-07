//
//  LabelTextEnum.swift
//  Calculator
//
//  Created by Min Hyun on 2023/06/07.
//

enum MultiUseString {
    case empty
    case zero
    case nan
    case negative
    case doubleZero
    case dot
    
    var value: String {
        switch self {
        case .empty:
            return ""
        case .zero:
            return "0"
        case .nan:
            return "NaN"
        case .negative:
            return "-"
        case .doubleZero:
            return "00"
        case .dot:
            return "."
        }
    }
}
