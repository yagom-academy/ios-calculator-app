//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Kiseok on 2023/10/03.
//

struct CalculatorItemQueue<Element: CalculateItem> {
    private(set) var enqueueBox: [Element] 
    private(set) var dequeueBox: [Element] = []
    
    init(enqueueBox: [Element]) {
        self.enqueueBox = enqueueBox
    }
    
    var isEmpty: Bool {
        return enqueueBox.isEmpty && dequeueBox.isEmpty
    }
    
    var count: Int {
        return enqueueBox.count + dequeueBox.count
    }
    
    var peek: Element? {
        return dequeueBox.last ?? enqueueBox.first
    }
    
    mutating func enqueue(_ element: Element) {
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
