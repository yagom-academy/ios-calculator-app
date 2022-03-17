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
    associatedtype Element
    var isEmpty: Bool { get }
    var count: Int { get }
    
    func append(_ data: Element)
    func removeFirst() -> Element?
    func removeAll()
}

final class LinkdeList<Element: CalculateItem>: List {
    private var head: Node<Element>?
    private var tail: Node<Element>?
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
    
    func append(_ data: Element) {
        let node = Node(data: data)
        if head == nil {
            head = node
            tail = head
        } else {
            tail?.next = node
            tail = node
        }
    }
    
    @discardableResult
    func removeFirst() -> Element? {
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
