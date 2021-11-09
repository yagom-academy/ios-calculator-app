//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Jae-hoon Sim on 2021/11/08.
//

import Foundation

struct CalculatorItemQueue<Item> {
    private var list = [Item]()
    var isEmpty: Bool {
        list.isEmpty
    }
    var front: Item? {
        list.first
    }
    var count: Int {
        list.count
    }
    
    mutating func enqueue(_ item: Item) {
        list.append(item)
    }
    
    mutating func dequeue() -> Item? {
        if list.isEmpty {
            return nil
        }
        return list.removeFirst()
    }
}
