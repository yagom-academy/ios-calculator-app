//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by marisol on 2022/03/15.
//

struct CalculatorItemQueue<T: CalculateItem> {
    private var nodeList: Array<T> = Array<T>()
    
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
        guard !nodeList.isEmpty else { return nil }
        return nodeList.removeFirst()
    }
}
