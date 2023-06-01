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
        if head == nil {
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
    
    var count: Int {
        if head == nil {
            return 0
        }
        
        var count = 1
        while let next = head?.next {
            head = next
            count += 1
        }
        return count
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
    
    func popFirst() -> T? {
        guard let data: T = head?.data else {
            return nil
        }
        
        head = head?.next
        
        return data
    }
}
