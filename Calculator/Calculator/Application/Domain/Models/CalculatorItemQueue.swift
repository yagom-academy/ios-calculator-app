//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Gordon Choi on 2022/05/17.
//

struct CalculatorItemQueue<T>: Queue {
    private var array: [T] = []
    
    init(array: [T]) {
        self.array = array
    }
    
    var isEmpty: Bool {
        array.isEmpty
    }
    
    var peek: Element? {
        array.first
    }
    
    mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    mutating func dequeue() -> T? {
        isEmpty ? nil : array.removeFirst()
    }
}
