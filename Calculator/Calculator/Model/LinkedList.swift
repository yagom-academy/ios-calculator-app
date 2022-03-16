//
//  LinkedList.swift
//  Calculator
//
//  Created by 김태현 on 2022/03/14.
//

final class Node<T> {
    let data: T
    var next: Node?
    
    init(data: T) {
        self.data = data
    }
}

extension Node: Equatable {
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs === rhs
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
        guard let currentLastNode = findLast() else {
            head = node
            return
        }
        currentLastNode.next = node
    }
    
    func findLast() -> Node<T>? {
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

extension LinkedList: Sequence {
    func makeIterator() -> LinkedListIterator<T> {
        return LinkedListIterator(current: self.head)
    }
}

struct LinkedListIterator<T>: IteratorProtocol {
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

extension Node: Sequence {
    func makeIterator() -> NodeIterator<T> {
        return NodeIterator(current: self)
    }
}

struct NodeIterator<T>: IteratorProtocol {
    var current: Node<T>?
    
    mutating func next() -> T? {
        if let node = current {
            let data = node.data
            
            current = node.next
            return data
        } else {
            return nil
        }
    }
}
