//
//  OperatorError.swift
//  Calculator
//
//  Created by 이예은 on 2022/05/20.
//

import Foundation

enum OperatorError: Error {
    case divideError
    
    var errorPrint: String {
        switch self {
        case .divideError:
            return "NAN"
        }
    }
}
