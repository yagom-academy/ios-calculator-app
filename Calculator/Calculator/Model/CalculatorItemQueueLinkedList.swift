//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by karen on 2023/06/07.
//

final class Node<T> {
    var data: T
    var prev: Node?
    var next: Node?
    
    init(data: T) {
        self.data = data
    }
}

struct CalculatorItemQueueLinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var first: T? {
        return head?.data
    }
    
    var last: T? {
        return tail?.data
    }
    
    mutating func append(data: T) {
        let newNode = Node(data: data)
        
        guard let tailNode = head else {
            head = newNode
            tail = newNode
            return
        }
        newNode.prev = tailNode
        tailNode.next = newNode
        tail = newNode
    }
    
    mutating func removeFirst() {
        guard let firstNode = head else { return }
        
        head = firstNode.next
        if head == nil {
            tail = nil
        } else {
            head?.prev = nil
        }
    }
}
