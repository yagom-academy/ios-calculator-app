//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 황제하 on 2021/11/08.
//

import Foundation

struct CalculatorItemQueue<T> {
    let items: LinkedList<T> = LinkedList<T>()
    
    func enqueue(value: T) {
        self.items.addRear(value)
    }
    
    func dequeue() -> T? {
        guard let node = self.items.removeFront() else {
            return nil
        }
        
        return node.value
    }
}
