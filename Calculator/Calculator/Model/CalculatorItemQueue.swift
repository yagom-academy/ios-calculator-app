//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Christy, Muri on 2023/01/24.
//

import Foundation

struct CalculatorItemQueue<Element: CalculateItem> {
    private var data: [Element?] = []
    var head: Int = 0
    
    var count: Int {
        return data.count - head
    }
    
    var isEmpty: Bool {
        return data.isEmpty
    }
    
    func peek() -> Element? {
        return isEmpty ? nil : data[head]
    }
    
    mutating func clearAll() {
        return data.removeAll()
    }
    
    mutating func enqueue(_ element: Element) {
        data.append(element)
    }
    
    mutating func dequeue() -> Element? {
        guard head < data.count, let element = data[head] else { return nil }
        data[head] = nil
        head += 1
        
        let percentage = Double(head)/Double(data.count)
        
        if data.count >= 40 && percentage >= 0.25 {
            data.removeFirst(head)
            head = 0
        }
        
        return element
    }
}
