//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Baek on 2022/05/17.
//

import Foundation

struct CalculatorItemQueue<T>: CalculateItem {
    var linkedList = LinkedList<T>()
    
    var isEmpty: Bool {
        return linkedList.headIsEmpty
    }
    
    var peek: Node<T>? {
        return linkedList.firstPeek
    }
    
    mutating func enqueue(_ element: T){
        linkedList.append(data: element)
    }
    
    mutating func dequeue() -> T? {
        return linkedList.removeFirst()
    }
    
    mutating func removeAll() {
        linkedList.removeAll()
    }
}
