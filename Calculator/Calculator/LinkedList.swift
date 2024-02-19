//
//  CustomLinkedList.swift
//  Calculator
//
//  Created by JIWOONG on 2024/02/17.
//

struct LinkedList<E> {
    private var head: Node<E>?
    private var tail: Node<E>?
    var isEmpty: Bool { head == nil }
    var count: Int {
        var result = 0
        var temp = head
        while temp != nil {
            temp = temp?.next
            result += 1
        }
        return result
    }
    
    mutating func addLast(element: E) {
        let newNode = Node(data: element, next: nil)
        if isEmpty {
            head = newNode
            tail = head
        } else {
            tail?.next = newNode
            tail = newNode
        }
    }
    
    mutating func deleteFirst() -> E? {
        if isEmpty {
            return nil
        } else if head?.next == nil {
            let result = head?.data
            head = nil
            tail = nil
            
            return result
        } else {
            let result = head?.data
            head = head?.next
            
            return result
        }
    }
    
    private mutating func deleteFirstWithoutReturn() {
        if isEmpty {
            return
        } else if head?.next == nil {
            head = nil
            tail = nil
        } else {
            head = head?.next
        }
    }
    
    func peek() -> E? {
        if isEmpty {
            return nil
        } else {
            return head?.data
        }
    }
    
    mutating func clear() {
        for _ in 0...count {
            deleteFirstWithoutReturn()
        }
    }

}
