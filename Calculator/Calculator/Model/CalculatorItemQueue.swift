//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Rowan on 2023/01/24.
//

struct CalculatorItemQueue<Element: CalculateItem> {
    
    private var queue: LinkedList<Element>
    
    var itemCount: Int {
        return self.queue.count
    }
    
    func isEmpty() -> Bool {
        let result = self.queue.isEmpty
        
        return result
    }
    
    mutating func enqueue(_ element: Element) {
        queue.appendLast(element)
    }
    
    @discardableResult
    mutating func dequeue() -> Element? {
        guard let element = queue.removeFirst() else { return nil }
        
        return element
    }
    
    mutating func removeAll() {
        queue.removeAll()
    }
    
    init(queueList: LinkedList<Element>) {
        self.queue = queueList
    }
    
}
