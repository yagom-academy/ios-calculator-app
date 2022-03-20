//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 김태현 on 2022/03/14.
//

struct CalculatorItemQueue {
    private let linkedList = LinkedList<CalculateItem>()
    
    func isEmpty() -> Bool {
        return linkedList.isEmpty()
    }
    
    func enqueue(_ node: Node<CalculateItem>) {
        linkedList.append(node: node)
    }
    
    func dequeue() -> CalculateItem? {
        linkedList.removeFirst()
    }
    
    func clear() {
        linkedList.clear()
    }
}

extension CalculatorItemQueue: Sequence {
    func makeIterator() -> QueueIterator {
        return QueueIterator(current: linkedList.head)
    }
}

struct QueueIterator: IteratorProtocol {
    var current: Node<CalculateItem>?
    
    mutating func next() -> Node<CalculateItem>? {
        if let node = current {
            current = node.next
            return node
        } else {
            return nil
        }
    }
}
