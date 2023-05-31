//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by idinaloq on 2023/05/29.
//

struct CalculatorItemQueue<T: CalculateItem> {
    private(set) var list: LinkedList<T> = LinkedList()
    
    mutating func enqueue(_ value: T) {
        list.appendLast(data: value)
    }
    
    mutating func dequeue() -> T? {
        let removedData = list.removeFirst()
        return removedData
    }
    
    mutating func removeAll() {
        list.removeAll()
    }
}
