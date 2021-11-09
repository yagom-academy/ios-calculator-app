//
//  CalculatorQueue.swift
//  Calculator
//
//  Created by Sunwoo on 2021/11/09.
//

import Foundation

protocol CalculatorItem {
    
}

struct CalculatorItemQueue {
    var operationStorage: [CalculatorItem] = []
    
    mutating func enqueue(operation: CalculatorItem) {
        operationStorage.append(operation)
    }
    
    func dequeue() -> CalculatorItem {
        return ""
    }
}

extension String: CalculatorItem {

}

