//
//  QueueError.swift
//  Calculator
//
//  Created by 이차민 on 2021/11/12.
//

import Foundation

enum QueueError: Error {
    case queueIsEmpty
}

extension QueueError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .queueIsEmpty:
            return "queue에 요소가 없습니다."
        }
    }
}
