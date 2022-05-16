//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Gordon Choi on 2022/05/17.
//

struct CalculatorItemQueue<T>: Queue {
    private var array: [T] = []
    
    init() {}
    
    var isEmpty: Bool {
        return true
    }
    
    var peek: Element? {
        return nil
    }
    
    mutating func enqueue(_ element: T) -> Bool {
        return true
    }
    
    mutating func dequeue() -> T? {
        return nil
    }
}
