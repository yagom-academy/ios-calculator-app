//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 혜모리 on 2023/01/24.
//

struct CalculatorItemQueue: CalculateItem {
    private(set) var queue: LinkedList = LinkedList()
    
    func enqueue(_ data: String) {
        queue.appendLast(data)
    }
    
    func removeRear() -> Node? {
        return queue.removeLast()
    }
    
    func deququ() -> Node? {
        return queue.removeFirst()
    }
    
    func removeAll() {
        queue.removeAll()
    }
}
