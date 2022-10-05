//
//  CalculatorItemQueue.swift
//  Created by Wonbi, Ash
//

struct CalculatorItemQueue<T: CalculateItem> {
    var list: LinkedList<T> = LinkedList<T>()
    
    var count: Int {
        return list.nodeCount
    }
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    var statusQueue: [T] {
        var result: [T] = [T]()
        var queue = self
        
        while !queue.isEmpty {
            if let component = queue.dequeue() {
                result.append(component)
            }
        }
        return result
    }
    
    mutating func enqueue(_ element: T) {
        list.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> T? {
        list.removeFirst()
    }
    
    mutating func removeAll() {
        list.removeAll()
    }
}
