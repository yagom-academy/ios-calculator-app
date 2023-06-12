//
//  LinkedList.swift
//  Calculator
//
//  Created by redmango1446 on 2023/06/01.
//

struct LinkedList<Element> {
    private var head: Node<Element>?
    private var tail: Node<Element>?
    private(set) var count: Int = 0
    
    var isEmpty: Bool {
        if let head {
            return false
        }
        
        return true
    }
    
    var first: Element? {
        return head?.data
    }
    
    var last: Element? {
        return tail?.data
    }
    
    mutating func append(_ newElement: Element) {
        let newData = Node(data: newElement)
        
        if isEmpty {
            head = newData
            tail = newData
            count += 1
            
            return
        }
        
        tail?.next = newData
        tail = newData
        count += 1
    }
    
    mutating func popFirst() -> Element? {
        guard let data = head?.data else {
            return nil
        }
        
        head = head?.next
        count -= 1
        
        return data
    }
}
