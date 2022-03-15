//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 김태현 on 2022/03/14.
//

final class CalculatorItemQueue {
    let queue: LinkedList<CalculatorItem>
    
    init(node: Node<CalculatorItem>) {
        self.queue = LinkedList<CalculatorItem>.init(head: node)
    }
    
    func isEmpty() -> Bool {
        return queue.isEmpty()
    }
    
    func enqueue(_ node: Node<CalculatorItem>) {
        queue.append(node: node)
    }
    
    func dequeue() -> CalculatorItem? {
        queue.removeFirst()
    }
    
    func clear() {
        queue.clear()
    }
}
