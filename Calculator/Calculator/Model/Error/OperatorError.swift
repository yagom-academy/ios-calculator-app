//
//  OperatorError.swift
//  Calculator
//
//  Created by yeton on 2022/05/20.
//

import Foundation

enum OperatorError: Error {
    case divideError
    
    var print: String {
        switch self {
        case .divideError:
            return "NAN"
        }
    }
}
