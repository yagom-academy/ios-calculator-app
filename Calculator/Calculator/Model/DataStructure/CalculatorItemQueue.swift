//  CalculatorItemQueue.swift
//  Created by 레옹아범 on 2023/01/24.

struct CalculatorItemQueue<Element: CalculateItem> {
    private var items = LinkedList<Element>()
    
    var isEmpty: Bool {
        self.items.isEmpty
    }
    var peek: Element? {
        self.items.peek
    }
    var back: Element? {
        self.items.back
    }
    
    mutating func enqueue(_ element: Element) {
        self.items.append(element)
    }
    
    mutating func dequeue() -> Element? {
        return self.items.removeFirst()
    }
    
    mutating func removeAll() {
        self.items.removeAll()
    }
}
