//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Daehoon Lee on 2023/05/31.
//

struct CalculatorItemQueue<T: CalculateItem> {
    var linkedList: LinkedList<T> = LinkedList()
    
    mutating func enqueue(_ element: T) {
        linkedList.append(element)
    }
    
    mutating func dequeue() -> T? {
        return linkedList.removeFirst()
    }
}
