//
//  CalculateError.swift
//  Calculator
//
//  Created by 박병호 on 2021/11/11.
//

import Foundation

enum CalculateError: Error {
    case notNumber
}

extension CalculateError: CustomStringConvertible {
    var description: String {
        switch self {
        case .notNumber:
            return "NaN"
        }
    }
}


