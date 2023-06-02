//
//  LinkedList.swift
//  Calculator
//
//  Created by redmango1446 on 2023/06/01.
//

final class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var isEmpty: Bool {
        guard head != nil else {
            return true
        }
        return false
    }
    
    var first: Node<T>? {
        return head
    }
    
    var last: Node<T>? {
        return tail
    }
    
    private(set) var count: Int = 0

    func append(_ NewElement: T) {
        let newData = Node(data: NewElement)
        
        if head == nil {
            head = newData
            tail = newData
            count += 1
            return
        }
        
        tail?.next = newData
        tail = newData
        count += 1
    }
    
    func popFirst() -> T? {
        guard let data = head?.data else {
            return nil
        }
        
        head = head?.next
        
        count -= 1
        return data
    }
}
