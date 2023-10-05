//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Lee minyeol on 2023/10/04.
//

struct CalculatorItemQueue<List: CalculateItem> {
    private var list: [List] = []
    
    var count: Int {
        return list.count
    }
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    mutating func enqueue(_ element: List) {
        list.append(element)
    }
    
    mutating func dequeue() -> List? {
        if isEmpty {
            return nil
        } else {
            return list.removeFirst()
        }
    }
    
    mutating func clear() {
        list.removeAll()
    }
}
