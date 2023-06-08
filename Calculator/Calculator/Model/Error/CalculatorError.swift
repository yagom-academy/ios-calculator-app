//
//  CalculatorError.swift
//  Calculator
//
//  Created by Hemg on 2023/06/08.
//

enum CalculatorError: Error {
    case missingOperand
    
    var localized: String {
        switch self {
        case .missingOperand:
            return "피연산자가 없습니다"
        }
    }
}
