//
//  Queue.swift
//  Calculator.swift
//
//  Created by JeongTaek Han on 2021/11/09.
//

import Foundation

protocol CalculateItem { }

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

class LinkedList<Element> {
    var head: Node<Element>?
    
    func append(_ item: Element) {
        if head == nil {
            self.head = Node(item)
        } else {
            var ptr = head
            while ptr?.next != nil {
                ptr = ptr?.next
            }
            ptr?.next = Node(item, prev: ptr)
        }
    }
    
    @discardableResult
    func remove(at index: Int) -> Element? {
        guard head != nil else { return nil }
        
        if index == 0 {
            var ptr = head
            let oldValue = head?.item
            ptr = head?.next
            ptr?.prev = nil
            head = ptr
            return oldValue
        } else {
            var ptr = head
            for _ in 0..<index {
                ptr = ptr?.next
            }
            var prev = ptr?.prev
            prev?.next = ptr?.next
            ptr?.next?.prev = prev
            return ptr?.item
        }
    }
    
    subscript(_ index: Int) -> Element? {
        var ptr = head
        for _ in 0..<index {
            ptr = ptr?.next
        }
        return ptr?.item
    }
}
