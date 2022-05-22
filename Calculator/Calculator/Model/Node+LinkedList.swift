//
//  Node+LinkedList.swift
//  Calculator
//
//  Created by Minseong Kang on 2022/05/22.
//

import Foundation

final class Node<T> {
    
    // MARK: - Properties
    
    var data: T
    var nextNode: Node?
    
    // MARK: - Action
    
    init(_ data: T) {
        self.data = data
    }
}

final class LinkedList<Element> {
    
    // MARK: - Properties
    
    private(set) var head: Node<Element>?
    
    // MARK: - Action
    
    func append(_ newNode: Node<Element>) {
        if head == nil {
            head = newNode
        }
        
        var currentNode = head
        
        while currentNode?.nextNode != nil {
            currentNode = currentNode?.nextNode
        }
        
        currentNode?.nextNode = newNode
    }
    
    func isEmpty() -> Bool {
        return head == nil ? true : false
    }
}
