//
//  LinkedList.swift
//  Calculator
//
//  Created by jyubong on 2023/10/03.
//

final class LinkedList<DataType> {
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
    
    func append(_ data: DataType) {
        let newNode: Node = Node(data: data)
        
        guard !isEmpty else {
            head = newNode
            tail = newNode
            count += 1
            return
        }
        
        if count == 1 {
            tail = newNode
            head?.next = tail
        } else {
            tail?.next = newNode
            tail = newNode
        }
        
        count += 1
    }
    
    @discardableResult
    func removeFirst() -> DataType? {
        guard !isEmpty else { return nil }
        
        let node = head
        head = head?.next
        count -= 1
        
        return node?.data
    }
}
