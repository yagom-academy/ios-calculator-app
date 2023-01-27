//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 무리 on 2023/01/24.
//

import Foundation

struct CalculatorItemQueue<Element: CalculatorItem> {
    private var data: [Element?] = []
    var head: Int = 0
    
    var isEmpty: Bool {
        return data.isEmpty
    }
    
    var count: Int {
        return data.count - head
    }

    var first: Element? {
        guard isEmpty == false else { return nil }
        return data[head]
    }
    
    var last: Element? {
        guard isEmpty == false, let element = data.last else { return nil }
        return element
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
    
    mutating func clearAll() {
        data.removeAll()
    }
}
