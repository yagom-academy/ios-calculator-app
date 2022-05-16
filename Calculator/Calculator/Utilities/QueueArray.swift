//
//  QueueArray.swift
//  Calculator
//
//  Created by Gordon Choi on 2022/05/17.
//

struct QueueArray<T>: Queue {
    private var array: [T] = []
    
    init() {}
    
    var isEmpty: Bool {
        true
    }
    
    var peek: T? {
        nil
    }
    
    mutating func enqueue(_ element: T) -> Bool {
        return true
    }
    
    mutating func dequeue() -> T? {
        return nil
    }
}
