//
//  UnexpectedError.swift
//  Calculator
//
//  Created by kyungmin, EtialMoon on 2023/06/15.
//

import Foundation

enum CalculatorError: Error, LocalizedError {
    case unexpectedError
    case unReadyError
    
    var errorDescription: String {
        switch self {
        case .unexpectedError:
            return "Unexpected Error"
        case .unReadyError:
            return "UnReady Error"
        }
    }
}
