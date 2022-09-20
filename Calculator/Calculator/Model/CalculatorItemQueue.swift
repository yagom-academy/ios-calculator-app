//  CalculatorItemQueue.swift
//  Created by zhilly on 2022/09/20.

struct CalculatorItemQueue<T> {
    var queue: [T] = []
    
    var isEmpty: Bool {
        return queue.isEmpty ? true : false
    }
}
