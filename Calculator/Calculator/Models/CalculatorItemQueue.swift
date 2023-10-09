//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Toy on 10/5/23.
//


struct CalculatorItemQueue<T: CalculateItem> {
    private var list = LinkedList<T>()
    
    mutating func enqueue(_ element: T) {
        list.append(value: element)
    }
    
    mutating func dequeue() -> T? {
        return list.removeFirst()
    }
    
    mutating func clear() {
        list.removeAll()
    }
    
    func isEmpty() -> Bool {
        return list.isEmpty
    }
    
    func count() -> Int {
        return list.count
    }
    
    func peek() -> T? {
        return list.first
    }
}
