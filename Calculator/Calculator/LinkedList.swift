//
//  LinkedList.swift
//  Calculator
//
//  Created by jyubong on 2023/10/03.
//

struct LinkedList<DataType> {
    final class Node<DataType> {
        private(set) var data: DataType
        var next: Node?
        
        init(data: DataType) {
            self.data = data
        }
    }
    
    private(set) var head: Node<DataType>?
    private(set) var tail: Node<DataType>?
    
    var count: Int {
        guard var node = head else {
            return 0
        }
        
        var count = 1
        
        while let next = node.next {
            node = next
            count += 1
        }
        
        return count
    }
    
    var isEmpty: Bool {
        return head == nil ? true : false
    }
    
    init(head: Node<DataType>? = nil, tail: Node<DataType>? = nil) {
        self.head = head
        self.tail = tail
    }
    
    mutating func append(_ data: DataType) {
        let newNode: Node = Node(data: data)
        
        if isEmpty {
            head = newNode
        } else {
            tail?.next = newNode
        }
        
        tail = newNode
    }
    
    @discardableResult
    mutating func removeFirst() -> DataType? {
        guard !isEmpty else { return nil }
        
        let node = head
        head = head?.next
        
        return node?.data
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
}
