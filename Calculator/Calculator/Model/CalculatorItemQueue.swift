//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 김태현 on 2022/03/14.
//

final class CalculatorItemQueue<T: CalculateItem> {
    let queue: LinkedList<T>
    
    init(node: Node<T>) {
        self.queue = LinkedList<T>.init(head: node)
    }
    
    func isEmpty() -> Bool {
        return queue.isEmpty()
    }
    
    func enqueue(_ node: Node<T>) {
        queue.append(node: node)
    }
    
    func dequeue() -> T? {
        queue.removeFirst()
    }
    
    func clear() {
        queue.clear()
    }
}

extension CalculatorItemQueue: Sequence {
    func makeIterator() -> queueIterator<T> {
        return queueIterator(current: self.queue.head)
    }
}

struct queueIterator<T>: IteratorProtocol {
    typealias Element = Node<T>
    
    var current: Element?
    
    mutating func next() -> Element? {
        if let node = current {
            current = node.next
            return node
        } else {
            return nil
        }
    }
}
