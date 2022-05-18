//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 허건 on 2022/05/17.
//

import Foundation

class CalculatorItemQueue<T>: CalculatorItem {

    var linkedList = LinkedList<T>()
    
    var count : Int {
        return linkedList.count
    }
    
    public func enqueue(_ element: T) {
        linkedList.append(data: element)
    }
    
    public func dequeue() {
        linkedList.removeFirst()
    }
    
    public func printLists() {
        linkedList.printLinkedList()
    }
    
    public func clear() {
        linkedList.removeAll()
    }
}

