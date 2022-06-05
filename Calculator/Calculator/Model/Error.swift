//
//  Error.swift
//  Calculator
//
//  Created by Minseong Kang on 2022/05/28.
//

enum CalculatorError: Error {
    case dividedByZero
    case emptyCalculatorItemQueue
    
    var description: String {
        switch self {
        case .dividedByZero:
            return "NaN"
        case .emptyCalculatorItemQueue:
            return "CalculatorItemQueue is empty"
        }
        
    }
}
