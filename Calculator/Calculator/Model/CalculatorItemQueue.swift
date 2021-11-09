//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 이아리 on 2021/11/08.
//

import Foundation

struct CalculatorItemQueue<Element>: CalculateItem {
    private var inBox = [Element]()
    private var outBox = [Element]()
    
    var front: Element? {
        return outBox.last ?? inBox.first
    }
    
    var count: Int {
        return inBox.count + outBox.count
    }
    
    var isEmpty: Bool {
        return inBox.isEmpty && outBox.isEmpty
    }
    
    mutating func enqueue(_ item: Element) {
        inBox.append(item)
    }
    
    @discardableResult
    mutating func dequeue() -> Element? {
        if outBox.isEmpty && inBox.isEmpty { return nil }
        
        if outBox.isEmpty {
            outBox = inBox.reversed()
            inBox.removeAll()
        }
        
        return outBox.removeLast()
    }
    
    mutating func clear() {
        inBox.removeAll()
        outBox.removeAll()
    }
}
