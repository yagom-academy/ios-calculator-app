//
//  File.swift
//  Calculator
//
//  Created by Kiseok on 2023/10/03.
//

struct CalculatorItemQueue<Element: CalculateItem> {
    private var enqueueBox: [Element] = []
    private var dequeueBox: [Element] = []
    
    var isEmpty: Bool {
        return enqueueBox.isEmpty && dequeueBox.isEmpty
    }
    
    var count: Int {
        return enqueueBox.count + dequeueBox.count
    }
    
    var front: Element? {
        return dequeueBox.last ?? enqueueBox.first
    }
    
    mutating func enqueue(element: Element) {
        enqueueBox.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> Element? {
        if dequeueBox.isEmpty {
            dequeueBox = enqueueBox.reversed()
            enqueueBox.removeAll()
        }
        
        return dequeueBox.popLast()
    }
    
    mutating func clear() {
        enqueueBox.removeAll()
        dequeueBox.removeAll()
    }
}
