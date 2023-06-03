//
//  LinkedList.swift
//  Calculator
//
//  Created by redmango1446 on 2023/06/01.
//

struct LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var isEmpty: Bool {
        guard head != nil else {
            return true
        }
        return false
    }
    
    var first: T? {
        return head?.data
    }
    
    var last: T? {
        return tail?.data
    }
    
    private(set) var count: Int = 0

    mutating func append(_ NewElement: T) {
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
    
    mutating func popFirst() -> T? {
        guard let data = head?.data else {
            return nil
        }
        
        head = head?.next
        
        count -= 1
        return data
    }
}
