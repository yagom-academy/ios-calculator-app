//
//  LinkedList.swift
//  Calculator
//
//  Created by Daehoon Lee on 2023/05/31.
//

struct LinkedList<Data>: Listable {
    private var head: Node<Data>?
    private var tail: Node<Data>?
    
    mutating func append(_ data: Data) {
        guard head != nil
        else {
            head = Node(data: data)
            tail = head
            return
        }
        
        tail?.updateNext(Node(data: data))
        tail = tail?.fetchNext()
    }
    
    mutating func removeFirst() -> Data? {
        guard head != nil else { return nil }
        
        if head === tail { tail = nil }
        
        let data = head?.fetchData()
        head = head?.fetchNext()
        
        return data
    }
}
