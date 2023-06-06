//
//  LabelTextEnum.swift
//  Calculator
//
//  Created by Min Hyun on 2023/06/07.
//

enum DefaultLabelText {
    case empty
    case zero
    case nan
    case negative
    
    var name: String {
        switch self {
        case .empty:
            return ""
        case .zero:
            return "0"
        case .nan:
            return "NaN"
        case .negative:
            return "-"
        }
    }
}
