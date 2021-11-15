//
//  QueueError.swift
//  Calculator
//
//  Created by 이차민 on 2021/11/12.
//

import Foundation

enum DataExtractionError: Error {
    case hasNoElement
}

extension DataExtractionError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .hasNoElement:
            return "데이터가 없습니다."
        }
    }
}
