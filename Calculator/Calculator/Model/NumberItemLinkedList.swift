//
//  NumberItemLinkedList.swift
//  Calculator
//
//  Created by Hemg on 2023/05/31.
//
final class NumberItemNode<T> {
    let value: T?
    var next: NumberItemNode?
    
    init(value: T?) {
        self.value = value
    }
}

struct NumberItemLinkedList<T: Equatable>: CalculateItem {
    private var head: NumberItemNode<T>?
    private var tail: NumberItemNode<T>?
    
    mutating func enqueueItem(item: T?) {
        let newNode = NumberItemNode(value: item)
        
        guard head != nil else {
            head = newNode
            tail = newNode
            return
        }
        
        tail?.next = newNode
        tail = newNode
    }
    
    mutating func dequeue() {
        guard head != nil else { return }
        
        guard head?.next != nil else {
            head = nil
            tail = nil
            return
        }
        
        var node = head
        
        while node?.next?.next != nil {
            node = node?.next
        }
        node?.next = nil
        tail = node
    }
    
    func checkContainsItem(_ item: T) -> (contains: Bool, value: T?) {
        var currentNode = head
        
        while let node = currentNode {
            guard node.value == item else {
                currentNode = node.next
                continue
            }
            return (true, node.value)
        }
        return (false, nil)
    }
}
