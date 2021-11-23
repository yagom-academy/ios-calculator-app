//
//  CalculateItemQueueError.swift
//  Calculator
//
//  Created by 박병호 on 2021/11/23.
//

import Foundation

enum CalculateItemQueueError: String, CustomStringConvertible, Error {
    case queueIsEmpty = "큐가 비어있습니다."
    
    var description: String {
        return rawValue
    }
}
