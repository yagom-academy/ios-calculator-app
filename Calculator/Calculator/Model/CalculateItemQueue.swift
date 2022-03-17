//  CalculateItemQueue.swift
//  Calculator
//  Created by LIMGAUI on 2022/03/15.

import Foundation

struct CalculateItemQueue<T: CalculateItem> {
    private let nodes = LinkedList<T>()
    
    var count: Int {
        return nodes.count
    }
    
    var isEmpty: Bool {
        return nodes.count == 0
    }
    
    func enqueue(_ node: T) {
        nodes.append(data: node)
    }
    
    func dequeue() -> T? {
        return isEmpty ? nil : nodes.removeFirst()
    }
    
    func removeAll() {
        nodes.removeAll()
    }
}
