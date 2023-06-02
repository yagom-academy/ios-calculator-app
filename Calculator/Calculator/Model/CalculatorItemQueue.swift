//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by EtialMoon on 2023/05/30.
//

struct CalculatorItemQueue<Element: CalculateItem> {
    private(set) var enqueuedCalculatorItems: [Element] = []
    private(set) var dequeueCalculatorItems: [Element] = []
    
    mutating func enqueue(_ element: Element) {
        enqueuedCalculatorItems.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> Element? {
        if dequeueCalculatorItems.isEmpty {
            dequeueCalculatorItems = enqueuedCalculatorItems.reversed()
            enqueuedCalculatorItems.removeAll()
        }
        
        return dequeueCalculatorItems.popLast()
    }
}
