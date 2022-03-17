//
//  DoublyLinkedList.swift
//  Calculator
//
//  Created by SeoDongyeon on 2022/03/15.
//

import Foundation

final class CalculatorLinkedList<T> {
    typealias Node = CalculatorNode<T>
    private var head: Node?
    private var tail: Node?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var count: Int {
        guard var node = head else { return 0 }
        var count = 1
        while let nextNode = node.next {
            node = nextNode
            count += 1
        }
        return count
    }
    
    func append(_ value: T) {
        let newNode = Node(value: value)
        
        if let previousTail = tail {
            newNode.previous = previousTail
            previousTail.next = newNode
            tail = newNode
        } else {
            head = newNode
            tail = newNode
        }
    }
    
    func removeFirst() -> T? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    func removeAll() {
        head = nil
        tail = nil
    }
}
