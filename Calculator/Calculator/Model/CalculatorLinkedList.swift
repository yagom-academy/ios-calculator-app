//
//  CalculatorLinkedList.swift
//  Calculator
//
//  Created by SeoDongyeon on 2022/03/28.
//

import Foundation

final class CalculatorLinkedList<T> {
    typealias Node = CalculatorNode<T>
    
    private var head: Node?
    private var tail: Node?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func append(_ value: T) {
        let newNode = Node(value: value)
        
        if isEmpty {
            head = newNode
            tail = newNode
            return
        }
        newNode.previous = tail
        tail?.next = newNode
        tail = newNode
    }
    
    func removeFirst() -> T? {
        if isEmpty {
            return nil
        }
        defer {
            let nextHead = head?.next
            head = nil
            head = nextHead
        }
        return head?.value
    }
}

