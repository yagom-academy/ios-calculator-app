//
//  LinkedList.swift
//  Calculator
//
//  Created by jyubong on 2023/10/03.
//

final class LinkedList<NodeDataType> {
    final class Node<DataType> {
        private(set) var data: DataType
        var next: Node?
        
        init(data: DataType) {
            self.data = data
        }
    }
    
    private(set) var head: Node<NodeDataType>?
    private(set) var tail: Node<NodeDataType>?
    
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
    
    init(head: Node<NodeDataType>? = nil, tail: Node<NodeDataType>? = nil) {
        self.head = head
        self.tail = tail
    }
    
    func append(_ data: NodeDataType) {
        let newNode: Node = Node(data: data)
        
        if isEmpty {
            head = newNode
        } else {
            tail?.next = newNode
        }
        
        tail = newNode
    }
    
    @discardableResult
    func removeFirst() -> NodeDataType? {
        guard !isEmpty else { return nil }
        
        let node = head
        head = head?.next
        
        return node?.data
    }
    
    func removeAll() {
        head = nil
        tail = nil
    }
}
