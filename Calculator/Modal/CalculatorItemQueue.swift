//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 우롱차 on 2022/03/15.
//



import Foundation

class CalculatorItemQueue {
    private var queue: [CalculateItem] = []
    
    func enqueue(calculateItem: CalculateItem) {
        queue.append(calculateItem)
    }
    
    func dequeue() -> CalculateItem? {
        if queue.isEmpty {
            return nil
        }
        let returnValue = queue.remove(at: 0)
        return returnValue
    }
    
    func isEmpty() -> Bool {
        return queue.isEmpty
    }
}




