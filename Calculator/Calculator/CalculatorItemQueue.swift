//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by redmango1446 on 2023/05/30.
//

struct CalculatorItemQueue<T>: CalculateItem {
    private var list: LinkedList<T> = LinkedList()
    
    var first: T? {
        return list.first
    }
    
    var last: T? {
        return list.last
    }
    
    var count: Int {
        return list.count
    }
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    mutating func enqueue(_ NewElement: T) {
        list.append(NewElement)
    }
    
    mutating func dequeue() -> T? {
        return list.popFirst()
    }
}
