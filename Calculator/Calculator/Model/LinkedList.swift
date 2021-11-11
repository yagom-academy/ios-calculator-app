//
//  LinkedList.swift
//  Calculator.swift
//
//  Created by JeongTaek Han on 2021/11/09.
//

import Foundation

final class LinkedList<Element> {
    private var head: Node<Element>?
    private var tail: Node<Element>?
    
    var count: Int {
        if isEmpty {
            return 0
        } else {
            var nodeCount = 1
            var currentPosition = head
            while currentPosition?.next != nil {
                currentPosition = currentPosition?.next
                nodeCount += 1
            }
            return nodeCount
        }
    }
    
    var first: Element? {
        head?.item
    }
    
    var last: Element? {
        tail?.item
    }
    
    var isEmpty: Bool {
        head == nil && tail == nil
    }
    
    func append(_ item: Element) {
        if isEmpty {
            head = Node(item)
            tail = head
        } else {
            tail?.next = Node(item, previous: tail)
            tail = tail?.next
        }
    }
    
    @discardableResult
    func removeFirst() -> Element? {
        if isEmpty { return nil }
        
        let firstItem = head?.item
        
        guard let nextPosition = head?.next else {
            tail = nil
            return firstItem
        }
        
        head = nextPosition
        head?.previous = nil
        
        return firstItem
    }
    
    @discardableResult
    func removeLast() -> Element? {
        if isEmpty { return nil }
        
        let lastItem = tail?.item
        
        guard let previousPosition = tail?.previous else {
            head = nil
            return lastItem
        }
        
        tail = previousPosition
        tail?.next = nil
        
        return lastItem
    }
    
    subscript(_ index: Int) -> Element? {
        var currentPosition = head
        for _ in 0..<index {
            currentPosition = currentPosition?.next
        }
        return currentPosition?.item
    }
    
    deinit {
        var currentPosition = head
        while currentPosition?.next != nil {
            currentPosition?.previous = nil
            currentPosition = currentPosition?.next
            currentPosition?.previous = nil
        }
    }
}
