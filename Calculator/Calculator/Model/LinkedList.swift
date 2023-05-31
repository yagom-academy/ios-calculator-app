//
//  LinkedList.swift
//  Calculator
//
//  Created by Daehoon Lee on 2023/05/31.
//

struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    init(head: Node<T>?) {
        self.head = head
    }
    
    mutating func append(_ data: T) {
        if head == nil {
            head = Node(data: data)
            tail = head
            return
        }
        
        tail?.updateNext(Node(data: data))
        tail = tail?.fetchNext()
    }
    
    mutating func removeFirst() -> T? {
        if head == nil { return nil }
        
        let data = head?.fetchData()
        head = head?.fetchNext()
        
        return data
    }
}
