//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 김태현 on 2022/03/14.
//

struct CalculatorItemQueue<T: CalculateItem> {
    private let linkedList = LinkedList<T>()
    
    func isEmpty() -> Bool {
        return linkedList.isEmpty()
    }
    
    func enqueue(_ node: Node<T>) {
        linkedList.append(node: node)
    }
    
    func dequeue() throws -> T {
        guard let data = linkedList.removeFirst() else {
            throw CalculatorError.unexpectedData
        }
        return data
    }
    
    func clear() {
        linkedList.clear()
    }
}

extension CalculatorItemQueue: Sequence {
    func makeIterator() -> QueueIterator<T> {
        return QueueIterator<T>(current: linkedList.head)
    }
}

struct QueueIterator<T>: IteratorProtocol {
    var current: Node<T>?
    
    mutating func next() -> Node<T>? {
        if let node = current {
            current = node.next
            return node
        } else {
            return nil
        }
    }
}
