//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by NAMU on 2022/05/17.
//

struct CalculatorItemQueue<T>: CalculatorItem {
    var list = LinkedList<T>()
    
    mutating func enQueue(data: T) {
        list.append(data: data)
    }
    
    mutating func deQueue() -> T? {
        return list.takeOutFirst()
    }
    
    func isEmpty() -> Bool {
        return list.isEmpty()
    }
}
