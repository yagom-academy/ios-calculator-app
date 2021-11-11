//
//  LinkedList.swift
//  Calculator.swift
//
//  Created by JeongTaek Han on 2021/11/09.
//

import Foundation

class Node<T> {
    var item: T
    var next: Node?
    var previous: Node?
    
    init(_ item: T, _ next: Node?, _ prev: Node?) {
        self.item = item
        self.next = next
        self.previous = prev
    }
    
    convenience init(_ item: T, prev: Node?) {
        self.init(item, nil, prev)
    }
    
    convenience init(_ item: T) {
        self.init(item, nil, nil)
    }
}

final class LinkedList<Element> {
    private var head: Node<Element>?
    private var tail: Node<Element>?
    
    var count: Int {
        if isEmpty {
            return 0
        } else {
            var nodes = 1
            var currentPosition = head
            while currentPosition?.next != nil {
                currentPosition = currentPosition?.next
                nodes += 1
            }
            return nodes
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
            tail?.next = Node(item, prev: tail)
            tail = tail?.next
        }
    }
    
    @discardableResult
    func removeFirst() -> Element? {
        if isEmpty { return nil }
        
        let item = head?.item
        if head?.next == nil {
            head = nil
            tail = nil
        } else {
            head = head?.next
            head?.previous = nil
        }
        
        return item
    }
    
    @discardableResult
    func removeLast() -> Element? {
        if isEmpty { return nil }
        
        let item = tail?.item
        if tail?.previous == nil {
            head = nil
            tail = nil
        } else {
            tail = tail?.previous
            tail?.next = nil
        }
        
        return item
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
