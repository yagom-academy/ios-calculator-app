//
//  LinkedList.swift
//  Calculator
//
//  Created by redmango1446 on 2023/06/01.
//

final class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?

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
    
    func popFirst() -> T? {
        guard let data: T = head?.data else {
            return nil
        }
        
        head = head?.next
        
        return data
    }
}
