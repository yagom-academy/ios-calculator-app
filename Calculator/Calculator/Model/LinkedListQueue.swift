//
//  LinkedListQueue.swift
//  Calculator
//
//  Created by 이아리 on 2021/11/08.
//

import Foundation

struct LinkedListQueue<T> {
    private(set) var list = LinkedList<T>()
    
    var count: Int {
        return list.count
    }
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    var front: T? {
        return list.first?.value
    }
    
    func enqueue(_ element: T) {
        list.append(element)
    }
    
    @discardableResult
    func dequeue() -> T? {
        if list.isEmpty { return nil }
        return list.removeFirst()
    }
    
    func clear() {
        list.removeAll()
    }
}
