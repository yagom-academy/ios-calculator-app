//
//  LinkedList.swift
//  Calculator
//
//  Created by Daehoon Lee on 2023/05/31.
//

struct LinkedList<T>: Listable {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    mutating func append(_ data: T) {
        guard head != nil
        else {
            head = Node(data: data)
            tail = head
            return
        }
        
        tail?.updateNext(Node(data: data))
        tail = tail?.fetchNext()
    }
    
    mutating func removeFirst() -> T? {
        guard head != nil else { return nil }
        
        if head === tail { tail = nil }
        
        let data = head?.fetchData()
        head = head?.fetchNext()
        
        return data
    }
}
