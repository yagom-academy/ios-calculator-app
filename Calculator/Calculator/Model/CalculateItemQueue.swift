//  CalculateItemQueue.swift
//  Calculator
//  Created by LIMGAUI on 2022/03/15.

import Foundation

struct CalculateItemQueue<T: CalculateItem> {
    private let store = LinkedList<T>()
    
    var count: Int {
        return store.count
    }
    
    var isEmpty: Bool {
        return store.isEmpty
    }
    
    func enqueue(_ node: T) {
        store.append(data: node)
    }
    
    var dequeue: T? {
        return store.removeFirst()
    }
    
    func removeAll() {
        store.removeAll()
    }
}
