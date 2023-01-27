//  Calculator - CalculatorItemQueue.swift
//  created by vetto on 2023/01/25

struct CalculatorItemQueue<Element: CalculateItem> {
    private(set) var calculatorQueue = LinkedList<Element>()
    
    var isEmpty: Bool {
        return calculatorQueue.isEmpty
    }
    
    mutating func enqueue(_ element: Element) {
        calculatorQueue.append(element)
    }
    
    mutating func dequeue() -> Element? {
        return calculatorQueue.removeFirst()
    }
    
    mutating func clear() {
        calculatorQueue.removeAll()
    }
}
