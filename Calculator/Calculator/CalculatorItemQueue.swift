//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by redmango1446 on 2023/05/30.
//

struct CalculatorItemQueue<T>: CalculateItem {
    private var list: LinkedList<T> = LinkedList()
    var first: T? { return list.first?.data }
    var count: Int { return list.count }
    var isEmpty: Bool { return list.isEmpty }
    
    func enqueue(_ NewElement: T) {
        list.append(NewElement)
    }
    
    func dequeue() -> T? {
        return list.popFirst()
    }
}
