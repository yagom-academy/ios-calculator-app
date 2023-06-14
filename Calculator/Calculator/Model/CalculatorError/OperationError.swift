//
//  OperationError.swift
//  Calculator
//
//  Created by kangkyungmin on 2023/06/07.
//

import Foundation

enum OperationError: Error, LocalizedError {
    case divideByZeroError
    case operandNotEnoughError
    case operatorNotEnoughError
    
    var errorDescription: String {
        switch self {
        case .operandNotEnoughError:
            return "Operand Not Enough Error"
        case .operatorNotEnoughError:
            return "Operator Not Enough Error"
        case .divideByZeroError:
            return "divide by zero"
        }
    }
}
