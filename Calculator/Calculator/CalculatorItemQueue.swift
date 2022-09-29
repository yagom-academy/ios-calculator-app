//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Mangdi on 2022/09/20.
//

import Foundation

struct CalculatorItemQueue<T: CalculateItem> {
    private var front: Node<T>?
    private var rear: Node<T>?
    
    func isEmpty() -> Bool {
        return front == nil
    }
    
    mutating func enqueue(_ item: T) {
        let newNode = Node(data: item)
        
        if isEmpty() {
            front = newNode
            rear = newNode
        } else {
            rear?.next = newNode
            rear = newNode
        } 
    }
    
    mutating func dequeue() -> T? {
        let data = front?.data
        front = front?.next
        return data
    }
    
    func peek() -> T? {
        front?.data
    }
}
