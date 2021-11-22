//
//  LinkedList.swift
//  Calculator
//
//  Created by Seul Mac on 2021/11/22.
//

import Foundation

struct LinkedList<Element: CalculateItem> {
    
    // MARK: private property
    
    private var head: Node<Element>?
    private var tail: Node<Element>?
}

// MARK: - internal method

extension LinkedList {
    
    mutating func append(data: Element) {
        let newNode = Node(data: data)
        
        if tail != nil {
            tail?.next = newNode
        }
        tail = newNode
        
        if head == nil {
            head = tail
        }
    }
    
    mutating func removeFirst() -> Element? {
        
        let removedData = head?.data
        head = head?.next
      
        return removedData
    }
    
    mutating func clear() {
        head = nil
        tail = nil
    }

}
