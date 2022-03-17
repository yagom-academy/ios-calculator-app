//
//  LinkdeList.swift
//  Calculator
//
//  Created by 이시원 on 2022/03/15.
//

import Foundation

final class Node<T> {
    var data: T
    var next: Node?
    
    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

protocol List {
    associatedtype T
    var isEmpty: Bool { get }
    var count: Int { get }
    
    func append(_ data: T)
    func removeFirst() -> T?
    func removeAll()
}

final class LinkdeList<T: CalculateItem> {
    private var head: Node<T>?
    private var tail: Node<T>?
    var isEmpty: Bool { head == nil }
    var count: Int { retrieveCount() }
    
    private func retrieveCount() -> Int {
        if head == nil {
            return 0
        }
        var count = 1
        var nodePoint = head
        while nodePoint?.next != nil {
            count += 1
            nodePoint = nodePoint?.next
        }
        return count
    }
    
    func append(_ data: T) {
        let node = Node(data: data)
        if head == nil {
            head = node
            tail = head
        } else {
            tail?.next = node
            tail = node
        }
    }
    
    func removeFirst() -> T? {
        let value = head?.data
        if head == nil { return nil }
        if head?.next == nil {
            head = nil
            tail = nil
        } else {
            head = head?.next
        }
        return value
    }
    
    func removeAll() {
        if head == nil { return }
        head = nil
        tail = nil
    }
}
