//
//  CalculateError.swift
//  Calculator
//
//  Created by 박병호 on 2021/11/11.
//

import Foundation

enum CalculateError: Error {
    case notANumber
}

extension CalculateError {
    var message: String? {
        switch self {
        case .notANumber:
            return "NaN"
        }
    }
}


