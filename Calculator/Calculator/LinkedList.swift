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
    var count: Int = 0
    
    var isEmpty: Bool {
        return count == 0 ? true : false
    }
    
    mutating func append(_ data: DataType) {
        let newNode: Node = Node(data: data)
        
        if isEmpty {
            head = newNode
        } else {
            tail?.next = newNode
        }
        
        tail = newNode
        count += 1
    }
    
    @discardableResult
    mutating func removeFirst() -> DataType? {
        guard !isEmpty else { return nil }
        
        let node = head
        head = head?.next
        count -= 1
        
        return node?.data
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
        count = 0
    }
}

extension LinkedList {
    subscript(at index: Int) -> Node<DataType>? {
        guard 0..<count ~= index else { return nil }
        
        var node = head
        
        for _ in 0..<index {
            let next = node?.next
            node = next
        }
        
        return node
    }
}
