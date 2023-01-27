//
//  LinkedList.swift
//  Calculator
//
//  Created by 혜모리 on 2023/01/25.
//

final class LinkedList<T: CalculateItem> {
    private(set) var head: Node<T>?
    private(set) var tail: Node<T>?
    var isEmpty: Bool {
        head == nil
    }
    
    func appendLast(_ data: T) {
        let node = Node<T>(value: data)
        
        guard isEmpty == false else {
            head = node
            tail = head
            return
        }
        tail?.next = node
        tail = node
    }
    
    @discardableResult
    func removeLast() -> Node<T>? {
        var currentNode = head
        
        guard isEmpty == false else {
            return nil
        }
        
        guard tail != nil else {
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
    
    @discardableResult
    func removeFirst() -> Node<T>? {
        let firstNode = head
        
        guard isEmpty == false else {
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
