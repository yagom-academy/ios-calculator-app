//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Jae-hoon Sim on 2021/11/08.
//

import Foundation

struct CalculatorItemQueue<Element> {
    private var list = LinkedList<Element>()
    var isEmpty: Bool {
        list.isEmpty
    }
    var front: Element? {
        list.first
    }
    var rear: Element? {
        list.tail?.value
    }
    var count: Int {
        list.count
    }
    
    mutating func enqueue(_ item: Element) {
        list.append(item)
    }
    
    mutating func dequeue() -> Element? {
        if list.isEmpty {
            return nil
        }
        return list.removeFirst()
    }
}
