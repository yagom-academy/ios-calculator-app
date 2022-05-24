//
//  Node+LinkedList.swift
//  Calculator
//
//  Created by Minseong Kang on 2022/05/22.
//

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
    private var tail: Node<Element>?
    
    var length: Int {
        var currentNode = head
        var count = 0
        
        while currentNode != nil {
            currentNode = currentNode?.nextNode
            count += 1
        }
        
        return count
    }
    
    // MARK: - Action
    
    func append(_ newNode: Node<Element>) {
        if head == nil {
            head = newNode
            return
        }
        
        tail?.nextNode = newNode
        tail = newNode
    }
    
    func isEmpty() -> Bool {
        return head == nil ? true : false
    }
    
    func removeFirstNode() -> Node<Element>? {
        if !isEmpty() {
            let removedNode = head ?? nil
            head = head?.nextNode
            return removedNode ?? nil
        }
        
        return nil
    }
}
