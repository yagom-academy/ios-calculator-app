//
//  CalculatorError.swift
//  Calculator
//
//  Created by hoon, Hemg on 2023/06/13.
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
