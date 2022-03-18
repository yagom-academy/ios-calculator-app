//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 우롱차 on 2022/03/15.
//



import Foundation

class CalculatorItemQueue<T> {
    private var queue: [T] = []
    
    func enqueue(_ item: T) {
        queue.append(item)
    }
    
    func dequeue() -> T? {
        if self.queue.isEmpty {
            return nil
        }
        let returnValue = queue.remove(at: 0)
        return returnValue
    }
    
    func isEmpty() -> Bool {
        return queue.isEmpty
    }
}




