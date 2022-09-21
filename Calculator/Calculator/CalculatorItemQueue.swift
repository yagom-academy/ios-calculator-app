//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Mangdi on 2022/09/20.
//

import Foundation

struct CalculatorItemQueue<T>: CalculateItem {
    var front: Node<T>?
    var rear: Node<T>?
    
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
        if !isEmpty() {
            guard let data = front?.data else { return nil }
            front = front?.next
            return data
        } else {
            print("비어있습니다")
            return nil
        }
    }
    
    func peek() -> T? {
        if !isEmpty() {
            let data = front?.data
            return data
        } else {
            return nil
        }
    }
}
