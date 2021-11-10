//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 이차민 on 2021/11/09.
//

import Foundation

struct CalculatorItemQueue<Element>: CalculateItem {
    var items = LinkedList<Element>()
    
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
