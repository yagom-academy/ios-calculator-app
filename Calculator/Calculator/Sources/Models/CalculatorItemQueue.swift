//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 재재 on 2022/05/18.
//

import Foundation

struct CalculatorItemQueue<T: CalculateItem> {
    
    private var inStackItems: [T] = []
    private var outStackItems: [T] = []
    
    init(inStackItems: [T] = [], outStackItems: [T] = []) {
        self.inStackItems = inStackItems
        self.outStackItems = outStackItems
    }
    
    var count: Int {
        return inStackItems.count + outStackItems.count
    }
    
    var isEmpty: Bool {
        return inStackItems.isEmpty && outStackItems.isEmpty
    }
    
    var peek: T? {
        return inStackItems.isEmpty ? outStackItems.last : inStackItems.first
    }
    
    mutating func enqueue(_ element: T) {
        inStackItems.append(element)
    }
    
    mutating func dequeue() -> T? {
        if outStackItems.isEmpty {
            outStackItems = inStackItems.reversed()
            inStackItems.removeAll()
        }
        return outStackItems.popLast()
    }
}

