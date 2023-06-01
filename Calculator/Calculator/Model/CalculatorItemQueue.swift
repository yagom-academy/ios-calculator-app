//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Minsup on 2023/05/30.
//

struct CalculatorItemQueue<Element: CalculateItem> {    
    private(set) var elements: [Element]
    
    init(_ elements:[Element] = []) {
        self.elements = elements
    }
    
    mutating func enqueue(_ element: Element) {
        self.elements.append(element)
    }
    
    mutating func dequeue() -> Element? {
        if self.elements.isEmpty {
            return nil
        } else {
            return self.elements.removeFirst()
        }
    }
    
    mutating func clear() {
        self.elements.removeAll()
    }
    
    var isEmpty: Bool {
        return self.elements.isEmpty
    }
    
    var count: Int {
        return self.elements.count
    }
}
