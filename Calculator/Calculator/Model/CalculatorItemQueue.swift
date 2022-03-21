//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by marisol on 2022/03/15.
//

import Foundation

struct CalculatorItemQueue<T: CalculateItem> {
    private var nodeList: Array<T?> = Array<T?>()
    private var head: Int = 0
    public var isEmpty: Bool {
        return nodeList.isEmpty
    }
    public var count: Int {
        return nodeList.count
    }
    
    public mutating func enqueue(_ element: T) {
        nodeList.append(element)
    }
    
    public mutating func dequeue() -> T? {
        guard head < nodeList.count else {
            return nil
        }
        guard let element = nodeList[head] else {
            return nil
        }
        nodeList[head] = nil
        head += 1
        
        let percentage = Double(head / nodeList.count)
        if head > 50, percentage > 0.3 {
            nodeList.removeFirst(head)
            head = 0
        }
        return element
    }
}
