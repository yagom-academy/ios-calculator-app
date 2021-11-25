//
//  NumberFormatError.swift
//  Calculator
//
//  Created by 박병호 on 2021/11/23.
//

import Foundation

enum NumberFormatError: Error {
    case numberFormatFailed
    case typeCastingFailed
}

extension NumberFormatError {
    var errorDescription: String {
        switch self {
        case .numberFormatFailed:
            return "Number fomatting 실패"
        case .typeCastingFailed:
            return "형변환 실패"
        }
    }
}
