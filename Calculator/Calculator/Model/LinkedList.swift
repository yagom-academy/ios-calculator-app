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
        guard self.head != nil else {
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
        self.head?.item
    }
    
    var last: Element? {
        self.tail?.item
    }
    
    func append(_ item: Element) {
        guard head != nil else {
            self.head = Node(item)
            self.tail = self.head
            return
        }
        self.tail?.next = Node(item, prev: self.tail)
        self.tail = self.tail?.next
    }
    
    @discardableResult
    func remove(at index: Int) -> Element? {
        guard head != nil, index >= 0 else { return nil }
        
        var ptr = head
        if index == 0 {
            let oldValue = head?.item
            ptr = head?.next
            ptr?.prev = nil
            head = ptr
            return oldValue
        } else {
            for _ in 0..<index {
                ptr = ptr?.next
            }
            let prev = ptr?.prev
            prev?.next = ptr?.next
            ptr?.next?.prev = prev
            return ptr?.item
        }
    }
    
    @discardableResult
    func removeFirst() -> Element? {
        self.remove(at: 0)
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
