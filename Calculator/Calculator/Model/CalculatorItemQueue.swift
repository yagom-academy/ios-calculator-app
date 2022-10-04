//
//  CalculatorItemQueue.swift
//  Calculator
//

struct CalculatorItemQueue<T: CalculateItem> {
    var list: LinkedList<T> = LinkedList<T>()
    
    var count: Int {
        return list.nodeCount
    }
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    mutating func enqueue(_ element: T) {
        list.append(element)
    }
    
    mutating func dequeue() {
        list.removeFirst()
    }
    
    mutating func removeAll() {
        list.removeAll()
    }
}
