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
    var prev: Node?
    
    init(_ item: T, _ next: Node?, _ prev: Node?) {
        self.item = item
        self.next = next
        self.prev = prev
    }
    
    convenience init(_ item: T, next: Node?) {
        self.init(item, next, nil)
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
        guard !isEmpty else {
            return 0
        }
        var nodes = 1
        var ptr = head
        while ptr?.next != nil {
            ptr = ptr?.next
            nodes += 1
        }
        return nodes
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
        guard !isEmpty else {
            self.head = Node(item)
            self.tail = self.head
            return
        }
        self.tail?.next = Node(item, prev: self.tail)
        self.tail = self.tail?.next
    }
    
    @discardableResult
    func removeFirst() -> Element? {
        guard !isEmpty else {
            return nil
        }
        
        let item = head?.item
        if head?.next == nil {
            head = nil
            tail = nil
        } else {
            head = head?.next
            head?.prev = nil
        }
        
        return item
    }
    
    @discardableResult
    func removeLast() -> Element? {
        guard !isEmpty else {
            return nil
        }
        
        let item = tail?.item
        if tail?.prev == nil {
            head = nil
            tail = nil
        } else {
            tail = tail?.prev
            tail?.next = nil
        }
        
        return item
    }
    
    subscript(_ index: Int) -> Element? {
        var ptr = head
        for _ in 0..<index {
            ptr = ptr?.next
        }
        return ptr?.item
    }
    
    deinit {
        var ptr = head
        while ptr?.next != nil {
            ptr?.prev = nil
            ptr = ptr?.next
            ptr?.prev = nil
        }
    }
}
