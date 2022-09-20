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
    
    func isCheckEmpty() -> Bool {
        if front == nil {
            return true
        } else {
            return false
        }
    }
    
    mutating func enQueue(_ item: T) {
        let newNode: Node<T>? = Node(data: item)
        
        if isCheckEmpty() {
            front = newNode
            rear = newNode
        } else {
            rear?.link = newNode
            rear = newNode
        }
    }
    
    mutating func deQueue() -> T? {
        if !isCheckEmpty() {
            guard let data = front?.data else { return nil }
            front = front?.link
            changeRear()
            
            return data
        } else {
            print("비어있습니다")
            return nil
        }
    }
    
    mutating func changeRear() {
        if isCheckEmpty() {
            rear = nil
        }
    }
    
    func peek() -> T? {
        if !isCheckEmpty() {
            let data = front?.data
            return data
        } else {
            return nil
        }
    }
}
