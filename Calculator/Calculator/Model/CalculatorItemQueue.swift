//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by smfc on 19/9/2022.
//

struct CalculatorItemQueue<T>: CalculateItem {
    var queue: [T?] = []
    var head: Int = 0
    
    mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    mutating func count() -> Int {
        return queue.count
    }
    
    func isEmpty() -> Bool {
            return queue.isEmpty
        }
    
}
