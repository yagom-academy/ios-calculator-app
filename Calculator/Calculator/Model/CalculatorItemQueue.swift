//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 써니쿠키 on 2022/09/19.
//

struct CalculatorItemQueue <T: CalculateItem> {
    var itemQueue: LinkedList<T>? = LinkedList()
    
    mutating func enqueue(_ data: T) {
        self.itemQueue?.append(data)
    }
    
    mutating func dequeue() -> Node<T>? {
        let firstItem = self.itemQueue?.removeFirst()
        return firstItem
    }

    mutating func clear() {
        self.itemQueue = nil
    }
    
    mutating func isEmpty() -> Bool {
        self.itemQueue?.head == nil ? true : false
    }
}
