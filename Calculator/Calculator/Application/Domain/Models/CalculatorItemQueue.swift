//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 나이든별, 민쏜
//

struct CalculatorItemQueue<T>: Queue where T: CalculateItem {
    private var array: [T] = []
    
    init(array: [T] = []) {
        self.array = array
    }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var peek: T? {
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
