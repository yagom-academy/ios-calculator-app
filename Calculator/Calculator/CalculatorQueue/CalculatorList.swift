//
//  CalculatorList.swift
//  Calculator
//
//  Created by 유한석 on 2022/05/17.
//
class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

class CalculatorList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    init(head: Node<T>? = nil) {
        self.head = head
        self.tail = head
    }
    
    func size() -> Int {
        guard var counterNode: Node = head else {
            return 0
        }
        var count: Int = 1
        while counterNode.next != nil {
            count += 1
            counterNode = counterNode.next!
        }
        return count
    }
    
    func append(_ newNode: Node<T>) {
        guard tail != nil else {
            tail = newNode
            head = newNode
            return
        }
        tail?.next = newNode
        tail = tail?.next
    }
    
    func isEmpty() -> Bool{
        if head == nil {
            return true
        } else {
            return false
        }
    }
    
    func removeAll() {
        tail = nil
        head = nil
    }
    
    func popLast() -> Node<T>? {
        let size = size()
        guard var node = self.head else {
            return nil
        }
        guard size > 1 else {
            let resultNode = head
            head = nil
            tail = nil
            return resultNode
        }
        var tailNode : Node<T>? = head ?? nil
        for _ in 1...size - 1 {
            guard let nextNode = node.next else {
                return nil
            }
            tailNode = node
            node = nextNode
        }
        tailNode?.next = nil
        tail = tailNode
        return node
    }
}
