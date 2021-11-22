//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Eunsoo KIM on 2021/11/09.
//

import Foundation

struct CalculatorItemQueue<Element: CalculateItem> {
    private var inBox = [Element]()
    private var outBox = [Element]()
    
    init(_ items: [Element] = []) {
        self.inBox = items
    }
    
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
        guard (outBox.isEmpty && inBox.isEmpty) == false else {
            return nil
        }
        if outBox.isEmpty {
            outBox = inBox.reversed()
            inBox = []
        }
        return outBox.removeLast()
    }
    
    mutating func clear() {
        inBox = []
        outBox = []
    }
}
