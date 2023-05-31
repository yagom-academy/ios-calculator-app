//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Minsup on 2023/05/30.
//

extension Int: CalculateItem { }

struct CalculatorItemQueue<Element: CalculateItem> {
    private var elements: [Element] = []
    
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
    
    var getElements: [Element] {
        return self.elements
    }
    
    var peek: Element? {
        return self.elements.first
    }
    
    var isEmpty: Bool {
        return self.elements.isEmpty
    }
    
    var count: Int {
        return self.elements.count
    }
}
