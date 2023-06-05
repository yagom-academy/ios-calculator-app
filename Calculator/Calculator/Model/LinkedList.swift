//
//  LinkedList.swift
//  Calculator
//
//  Created by Daehoon Lee on 2023/05/31.
//

struct LinkedList<DataType>: Listable {
    private var head: Node<DataType>?
    private var tail: Node<DataType>?
    var first: DataType? {
        return head?.fetchData()
    }
    var last: DataType? {
        return tail?.fetchData()
    }
    
    init(head: Node<DataType>? = nil, tail: Node<DataType>? = nil) {
        self.head = head
        self.tail = tail
    }
    
    mutating func append(_ data: DataType) {
        guard head != nil else {
            head = Node(data: data)
            tail = head
            return
        }
        
        tail?.updateNext(Node(data: data))
        tail = tail?.fetchNext()
    }
    
    mutating func removeFirst() -> DataType? {
        guard head != nil else {
            return nil
        }
        
        if head === tail {
            tail = nil
        }
        
        let data = head?.fetchData()
        head = head?.fetchNext()
        
        return data
    }
}
