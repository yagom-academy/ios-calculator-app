//
//  CalculateItemQueueError.swift
//  Calculator
//
//  Created by 박병호 on 2021/11/23.
//

import Foundation

enum CalculateItemQueueError: Error {
    case queueIsEmpty
}

extension CalculateItemQueueError {
    var errorDescription: String {
        switch self {
        case .queueIsEmpty:
            return "큐가 비어있습니다."
        }
    }
}
