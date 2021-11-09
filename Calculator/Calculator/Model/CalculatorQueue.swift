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
    
    mutating func enqueue(item: CalculatorItem) {
  
    }
    
    func dequeue() -> CalculatorItem {
        return ""
    }
}

extension String: CalculatorItem {

}

