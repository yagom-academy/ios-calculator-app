//  CalculatorItemQueue.swift
//  Calculator
//  Created by LIMGAUI on 2021/11/09.

import Foundation

struct CalculatorItemQueue<T: CalculatorItem> {
    private var nodes: [T] = []
    
    var bringNodes: [T] {
        nodes
    }
    
    mutating func push(_ item: T) {
        nodes.append(item)
    }
    
    mutating func deleteFront() -> T? {
        if isEmpty {
            return nil
        } else {
            return nodes.removeFirst()
        }
    }
    
    mutating func deleteRear() -> T? {
        if isEmpty {
            return nil
        } else {
            return nodes.removeLast()
        }
    }
    
    mutating func deleteAll() {
        nodes.removeAll()
    }
    
    var nodesSize: T {
        nodes.count as! T
    }
    
    var isEmpty: Bool {
        nodes.isEmpty
    }
}
