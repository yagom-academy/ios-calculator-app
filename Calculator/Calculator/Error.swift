//
//  Error.swift
//  Calculator
//
//  Created by Ryan-Son on 2021/04/01.
//

import Foundation

enum DecimalCalculatorError: Error, CustomStringConvertible {
    case divisionByZero
    case notAvailableOperator
    case notNumber
    case nilInputFoundWhileConvertingTypeOfOperator
    
    var description: String {
        switch self {
        case :
            
        default:
            <#code#>
        }
    }
}


