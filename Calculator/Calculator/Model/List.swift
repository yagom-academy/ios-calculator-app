//
//  List.swift
//  Calculator
//
//  Created by 이승재 on 2021/11/09.
//

import Foundation

class Node<T> {
    fileprivate var data: T?
    fileprivate var next: Node?
    
    init(data: T?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

struct LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    init() {}
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func append(_ data: T?) {
        if isEmpty {
            head = Node(data: data)
            tail = head
            return
        }
        
        tail?.next = Node(data: data)
        tail = tail?.next
    }
    
    @discardableResult
    mutating func pop() -> T? {
        if isEmpty {
            return nil
        }
        guard let result: Node = head else { return nil }
        head = head?.next
        if isEmpty {
            tail = nil
        }
        return result.data
    }
    
    @discardableResult
    mutating func removeLast() -> T? {
        guard let head = head else {
            return nil
        }
        if head.next == nil {
            return pop()
        }
        
        var prev = head
        var cur = head
        
        while let next = cur.next {
            prev = cur
            cur = next
        }
        prev.next = nil
        tail = prev

        return cur.data
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(data)"
        }
        return "\(data)" + ", " + "\(next)"
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "Queue is Empty"
        }
        return "[" + "\(head)" + "]"
    }
}
