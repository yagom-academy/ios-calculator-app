//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 허건 on 2022/05/17.
//

import Foundation

struct CalculatorItemQueue<T>: CalculatorItem {

    var linkedList = LinkedList<T>()
    
    mutating func enqueue(_ element: T) {
        linkedList.append(data: element)
    }
    
    mutating func dequeue() {
        linkedList.removeFirst()
    }
    
    mutating func clear() {
        linkedList.removeAll()
    }
    
    mutating func peek() -> Double {
        return linkedList.peekFrist() as! Double
    }
    
    mutating func doFristPeekAndremove() -> Double {
        return linkedList.peekAndRemove() as! Double
    }
}

