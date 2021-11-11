//
//  ParsingError.swift
//  Calculator
//
//  Created by 이승재 on 2021/11/11.
//

import Foundation

enum ParsingError: Error {
    case invalidStringForDouble
}

extension ParsingError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidStringForDouble:
            return "잘못된 피연산자 입력입니다."
        }
    }
}
