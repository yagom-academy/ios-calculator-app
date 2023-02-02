//  Calculator - CalculatorItemQueue.swift
//  created by vetto on 2023/01/25

struct CalculatorItemQueue<Element: CalculateItem> {
    private(set) var calculatorList = LinkedList<Element>()
    
    var isEmpty: Bool {
        return calculatorList.isEmpty
    }
    
    init(with queue: [Element] = []) {
        queue.forEach { enqueue($0) }
    }
    
    mutating func enqueue(_ element: Element) {
        calculatorList.append(element)
    }
    
    mutating func dequeue() -> Element? {
        return calculatorList.removeFirst()
    }
    
    mutating func clear() {
        calculatorList.removeAll()
    }
}
