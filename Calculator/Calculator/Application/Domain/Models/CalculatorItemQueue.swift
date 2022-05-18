//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Gordon Choi on 2022/05/17.
//

struct CalculatorItemQueue<T>: Queue where T: CalculateItem {
    private var array: [T] = []
    
    init(array: [T] = []) {
        self.array = array
    }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var peek: Element? {
        return array.first
    }
    
    @discardableResult
    mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
}
