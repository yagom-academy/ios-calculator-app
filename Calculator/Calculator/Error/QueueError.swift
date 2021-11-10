//
//  ListError.swift
//  Calculator
//
//  Created by 이승재 on 2021/11/10.
//

import Foundation

enum QueueError: Error {
    case isEmpty
}

extension QueueError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .isEmpty:
            return "리스트가 비어있습니다."
        }
    }
}
