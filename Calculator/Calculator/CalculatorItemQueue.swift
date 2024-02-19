//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by JIWOONG on 2024/02/19.
//

struct CalculatorItemQueue<E> {
    var list = LinkedList<E>()
    var isEmpty: Bool { list.isEmpty }
    var count: Int { list.count }
    
    mutating func enqueue(element: E) {
        list.addLast(element: element)
    }
    
    mutating func dequeue() -> E? {
        return list.deleteFirst()
    }
    
    func first() -> E? {
        return list.peek()
    }
    
    mutating func clear() {
        list.clear()
    }
}
