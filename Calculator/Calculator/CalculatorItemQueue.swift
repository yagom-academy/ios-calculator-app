//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Lee minyeol on 2023/10/04.
//

struct CalculatorItemQueue<T> {
    var queue: [T] = []
    
    var count: Int {
        return queue.count
    }
    
    var isEmpty: Bool {
        return queue.isEmpty
    }
}
