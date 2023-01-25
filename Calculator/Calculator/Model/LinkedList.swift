//
//  LinkedList.swift
//  Calculator
//
//  Created by 혜모리 on 2023/01/25.
//

final class LinkedList {
    private(set) var head: Node?
    private(set) var tail: Node?
    var isEmpty: Bool {
        head == nil
    }
    
    func appendLast(_ data: String) {
        let node = Node(value: data)
        
        guard !isEmpty else {
            head = node
            tail = head
            return
        }
        tail?.next = node
        tail = node
    }
    
    func removeLast() -> Node? {
        var currentNode = head
        
        guard !isEmpty else {
            return nil
        }
        
        guard head != tail else {
            head = nil
            return currentNode
        }
        
        while currentNode?.next?.next != nil {
            currentNode = currentNode?.next
        }
        
        let lastNode = currentNode?.next
        currentNode?.next = nil
        tail = currentNode
        return lastNode
    }
    
    func removeFirst() -> Node? {
        let firstNode = head
        
        guard !isEmpty else {
            return nil
        }
        head = firstNode?.next
        return firstNode
    }
    
    func removeAll() {
        head = nil
        tail = nil
    }
}
