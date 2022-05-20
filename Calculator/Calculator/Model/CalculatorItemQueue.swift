//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by dhoney96 on 2022/05/17.
//

struct CalculatorItemQueue<T>: CalculatorItem {
    private(set) var items = [T?]()
    private var head = 0
    
    func convertToDouble(from data: String) -> Double? {
        guard let number = Double(data) else { return nil }
        return number
    }
    
    mutating func enqueue(_ data: T) {
        items.append(data)
    }
    
    mutating func dequeue() -> T? {
        guard head < items.count, let element = items[head] else {
            return nil
        }
        items[head] = nil
        head += 1
        
        return element
    }
    
    mutating func clearAllItem() {
        guard !items.isEmpty else { return }
        items.removeAll()
    }
}
