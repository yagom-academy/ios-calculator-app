//
//  OperatorError.swift
//  Calculator
//
//  Created by yeton on 2022/05/20.
//

import Foundation

enum OperatorError: Error {
    case divide
    
    var print: String {
        switch self {
        case .divide:
            return "NaN"
        }
    }
}
