//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by NAMU on 2022/05/17.
//

struct CalculatorItemQueue<T>: CalculatorItem {
    var List: LinkedList<T>? = LinkedList<T>()
    
    mutating func enQueue(data: T) {
        List?.append(data: data)
    }
    
    mutating func deQueue() -> T? {
        return List?.takeOutFirst()
    }
    
    func isEmpty() -> Bool {
        return false
    }
}


