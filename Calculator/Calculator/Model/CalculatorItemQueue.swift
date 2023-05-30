//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by EtialMoon on 2023/05/30.
//

struct CalculatorItemQueue {
    private(set) var enqueuedCalculatorItems: [any CalculateItem] = []
    private(set) var dequeueCalculatorItems: [any CalculateItem] = []
    
    init() {}
    
    init(_ enqueuedCalculatorItems: [any CalculateItem]) {
        self.enqueuedCalculatorItems = enqueuedCalculatorItems
    }
    
    mutating func enqueue(_ element: any CalculateItem) {
        enqueuedCalculatorItems.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> (any CalculateItem)? {
        if dequeueCalculatorItems.isEmpty {
            dequeueCalculatorItems = enqueuedCalculatorItems.reversed()
            enqueuedCalculatorItems.removeAll()
        }
        
        return dequeueCalculatorItems.popLast()
    }
}
