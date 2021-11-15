//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 이차민 on 2021/11/09.
//

import Foundation

struct CalculatorItemQueue<Element: CalculateItem> {
    private(set) var items = LinkedList<Element>()
    
    var hasOneOrMoreItems: Bool {
        return self.items.count > 0
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
