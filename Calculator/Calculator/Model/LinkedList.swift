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

extension LinkedList: Sequence {
    typealias Element = Node<T>
    
    func makeIterator() -> LinkedListIterator<T> {
        return LinkedListIterator(current: self.head!)
    }
}

class LinkedListIterator<T>: IteratorProtocol {
    typealias Element = Node<T>
    
    var current: Element
    
    init(current: Element) {
        self.current = current
    }
    
    func next() -> Element? {
        return current.next
    }
}
