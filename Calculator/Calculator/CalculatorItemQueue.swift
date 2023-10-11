//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Hisop on 2023/10/05.
//

protocol CalculateItem { }

struct CalculateItemQueue<T> where T: CalculateItem {
    var list = LinkedList<T>()
    
    mutating func enqueue(value: T) {
        list.appendNode(value: value)
    }
    
    @discardableResult
    mutating func dequeue() -> T? {
        return list.removeFirstNode()
    }
    
    func peek() -> T? {
        return list.headValue
    }
    
    mutating func clear() {
        list.removeAll()
    }
    
    func isEmpty() -> Bool {
        return list.checkEmpty
    }
    
    func count() -> Int {
        return list.itemCount
    }
}
