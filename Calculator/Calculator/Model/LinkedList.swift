//
//  LinkedList.swift
//  Calculator
//
//  Created by 김태현 on 2022/03/14.
//

final class Node<T>: Equatable {
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs === rhs
    }
    
    let data: T
    var next: Node?
    
    init(data: T) {
        self.data = data
    }
}

final class LinkedList<T> {
    var head: Node<T>?
    
    init(head: Node<T>) {
        self.head = head
    }
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    func append(node: Node<T>) {
        findLastNode()?.next = node
    }
    
    func findLastNode() -> Node<T>? {
        var currentNode = head
        
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        return currentNode
    }
    
    func removeFirst() -> T? {
        let firstData = head?.data
        
        head = head?.next
        return firstData
    }
    
    func clear() {
        head = nil
    }
}
