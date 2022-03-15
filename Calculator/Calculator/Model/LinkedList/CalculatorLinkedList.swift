//
//  DoublyLinkedList.swift
//  Calculator
//
//  Created by SeoDongyeon on 2022/03/15.
//

import Foundation

final class CalculatorLinkedList<T> {
    typealias Node = CalculatorNode<T>
    var head: Node?
    var tail: Node?
    var count: Int {
        guard var node = head else { return Int.zero }
        var count = 1
        while let nextNode = node.next {
            node = nextNode
            count += 1
        }
        return count
    }
    
    func appendNewNode(_ value: T) {
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
    
    func removeAll() {
        head = nil
        tail = nil
    }
}

extension CalculatorLinkedList: CalculateItem {}
