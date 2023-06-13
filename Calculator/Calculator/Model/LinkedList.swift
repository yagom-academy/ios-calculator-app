//
//  LinkedList.swift
//  Calculator
//
//  Created by Daehoon Lee on 2023/05/31.
//

struct LinkedList<DataType>: Listable {
    private var head: Node<DataType>?
    private var tail: Node<DataType>?
    private var numberOfNode: Int = 0
    var first: DataType? {
        return head?.fetchData()
    }
    var last: DataType? {
        return tail?.fetchData()
    }
    var count: Int {
        return numberOfNode
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
        numberOfNode = 0
    }

    mutating func append(_ data: DataType) {
        guard head != nil else {
            head = Node(data: data)
            tail = head
            numberOfNode += 1
            return
        }
        
        tail?.updateNext(Node(data: data))
        tail = tail?.fetchNext()
        numberOfNode += 1
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
        numberOfNode -= 1
        
        return data
    }
}
