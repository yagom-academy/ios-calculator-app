//
//  CustomLinkedList.swift
//  Calculator
//
//  Created by JIWOONG on 2024/02/17.
//

struct LinkedList<E> {
    var head: Node<E>?
    var tail: Node<E>?
    var isEmpty: Bool { head == nil }
    var count: Int {
        return 0
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

}
