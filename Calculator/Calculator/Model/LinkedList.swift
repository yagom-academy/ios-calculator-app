//
//  LinkedList.swift
//  Calculator
//
//  Created by Daehoon Lee on 2023/05/31.
//

struct LinkedList<T> {
    var head: Node<T>?
    
    init(head: Node<T>?) {
        self.head = head
    }
    
    mutating func append(_ data: T) {
        if head == nil {
            head = Node(data: data)
            return
        }
        
        var node = head
        
        while node?.fetchNext() != nil {
            node = node?.fetchNext()
        }
        
        node?.updateNext(Node(data: data))
    }
    
    mutating func removeFirst() -> T? {
        if head == nil { return nil }
        
        let data = head?.fetchData()
        head = head?.fetchNext()
        
        return data
    }
}
