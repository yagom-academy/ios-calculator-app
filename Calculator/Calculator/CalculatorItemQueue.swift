//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Seoyeon Hong on 2023/01/26.
//
//MARK: Queue 타입 구현
struct CalculatorItemQueue<T>: CalculateItem {
    
    var head: Node<T>?
    
    var last: Node<T>? {
        if head == nil {
            return nil
        }
        var node = head
        while node?.nextData != nil {
            node = node?.nextData
        }
        return node
    }
    
    var isEmpty: Bool {
        if head == nil {
            return true
        }else {
            return false
        }
    }
    
    mutating func enqueue(_ element: T) {
        if let lastNode = last{
            lastNode.nextData = Node(data: element)
        }else {
            head = Node(data: element)
        }
    }
    
    mutating func dequeue() -> T? {
        if head == nil { return nil }
        
        guard let nowhead = head else {
            return nil
        }
        head = nowhead.nextData
        return nowhead.data
    }
    
    mutating func removeAll() {
        guard head != nil else {
            return
        }
        
        head = nil
    }
    
}
