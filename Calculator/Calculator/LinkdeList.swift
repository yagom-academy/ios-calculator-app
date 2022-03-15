//
//  LinkdeList.swift
//  Calculator
//
//  Created by 이시원 on 2022/03/15.
//

import Foundation

class Node<T> {
    var data: T
    var next: Node?
    
    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

class LinkdeList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    func append(_ data: T) {
        if head == nil {
            head = Node(data: data)
            tail = head
            return
        }
        
        let node = Node(data: data)
        tail?.next = node
        tail = node
        
    }
    
    func isEmpty() -> Bool {
        if head == nil {
            return true
        } else {
            return false
        }
    }
    
    func count() -> Int {
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
    
    func removeFirst() -> T? {
        let value: T?
        if head == nil { return nil }
        
        if head?.next == nil {
            value = head?.data
            head = nil
            tail = nil
            return value
        }
        value = head?.data
        head = head?.next
        return value
    }
    
    func removeAll() {
        if head == nil { return }
        
        head = nil
        tail = nil
    }
    
    func allData() -> [T]? {
        var dataArray: [T] = []

        if head == nil { return nil }
        var nodePoint = head
        while nodePoint?.next != nil {
            guard let value = nodePoint?.data else { return dataArray }
            dataArray.append(value)
            nodePoint = nodePoint?.next
        }
        guard let value = nodePoint?.data else { return dataArray }
        dataArray.append(value)
        return dataArray
    }

}
