//
//  NumberFormatError.swift
//  Calculator
//
//  Created by 박병호 on 2021/11/23.
//

import Foundation

enum NumberFormatError: String, Error {
    case numberFormatFailed = "Number fomatting 실패"
    case typeCastingFailed = "형변환 실패"
}

extension NumberFormatError: CustomStringConvertible {
    var description: String {
        return rawValue
    }
}
