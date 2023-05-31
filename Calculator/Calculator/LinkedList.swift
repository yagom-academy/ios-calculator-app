//
//  LinkedList.swift
//  Calculator
//
//  Created by redmango1446 on 2023/06/01.
//

final class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    func checkHeadValue() -> Node<T>? {
        return head
    }
    
    func checkTailValue() -> Node<T>? {
        return tail
    }
    
    func append(_ NewElement: T) {
        let newData = Node(data: NewElement)
        
        if head == nil {
            head = newData
            tail = newData
            return
        }
        
        tail?.next = newData
        tail = newData
    }
    
    func removeFirst() {
        head = head?.next
    }
}
