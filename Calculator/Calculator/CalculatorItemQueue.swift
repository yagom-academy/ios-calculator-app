//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by JIWOONG on 2024/02/19.
//

struct CalculatorItemQueue<E> {
    var list = LinkedList<E>()
    var isEmpty: Bool { list.isEmpty }
    
    mutating func enqueue(element: E) {
        list.addLast(element: element)
    }
    
    mutating func dequeue() -> E? {
        return list.deleteFirst()
    }
}
