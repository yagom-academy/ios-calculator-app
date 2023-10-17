//
//  LinkedList.swift
//  Calculator
//
//  Created by jyubong,Morgan.
//

final class LinkedList<DataType> {
    final class Node {
        private(set) var data: DataType
        private(set) var next: Node?
        
        init(data: DataType) {
            self.data = data
        }
        
        func setNext(_ node: Node) {
            self.next = node
        }
    }
    
    private(set) var head: Node?
    private(set) var tail: Node?
    
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
    
    init(head: Node? = nil, tail: Node? = nil) {
        self.head = head
        self.tail = tail
    }
    
    func append(_ data: DataType) {
        let newNode: Node = Node(data: data)
        
        if isEmpty {
            head = newNode
        } else {
            tail?.setNext(newNode)
        }
        
        tail = newNode
    }
    
    @discardableResult
    func removeFirst() -> DataType? {
        guard let headData = head?.data else {
            return nil
        }
        
        head = head?.next
        
        return headData
    }
    
    func removeAll() {
        head = nil
        tail = nil
    }
}
