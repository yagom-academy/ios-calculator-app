//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by redmango1446 on 2023/05/30.
//

struct CalculatorItemQueue<T>: CalculateItem {
    var list: LinkedList<T> = LinkedList()
    var count: Int { return list.count }
    
    func enqueue(_ NewElement: T) {
        list.append(NewElement)
    }
    
    func dequeue() -> T? {
        return list.popFirst()
    }
}
