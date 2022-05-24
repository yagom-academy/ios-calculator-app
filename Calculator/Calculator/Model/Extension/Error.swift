//
//  Error.swift
//  Calculator
//
//  Created by 허건 on 2022/05/23.
//

enum ErrorCase: Error {
    case operandsDequeue
    case operatorDequeue
    case listDequeue
}

extension ErrorCase {
    var errorDescription:String {
        switch self {
        case .operandsDequeue:
            return "operandsDequeue"
        case .operatorDequeue:
            return "operatorDequeue"
        case .listDequeue:
            return "NaN"
        }
    }
}
