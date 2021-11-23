//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 이차민 on 2021/11/09.
//

import Foundation

struct CalculatorItemQueue<Element: CalculateItem> {
    private(set) var items = LinkedList<Element>()
    
    init(_ items: [Element] = []) {
        for item in items {
            self.enqueue(item)
        }
    }
    
    var isEmpty: Bool {
        return self.items.isEmpty
    }
    
    func enqueue(_ value: Element) {
        items.appendNode(value: value)
    }
    
    @discardableResult
    func dequeue() -> Element? {
        let firstNode = items.removeFirstNode()
        return firstNode?.value
    }
    
    func removeAll() {
        items.removeAllNodes()
    }
}
