//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 장영우 on 2021/11/08.
//

import Foundation

struct CalculatorItemQueue {
    var queue: [CalculateItem] = []
    
    func enqueue(_ item: CalculateItem) {
        queue.append(item)
    }
    
    func allClear() {
        self.queue = []
    }
    
    func clear() {
        //TODO: -
    }
    
    func calculate() -> Double {
        var result: Double = 0
        
        for item in queue {
            result = item.calculate(originalValue: result)
        }
        
        return result
    }
}
