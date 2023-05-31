//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Serena on 2023/05/29.
//

struct CalculatorItemQueue {
    private(set) var queueForInt: [Int] = []
    private(set) var queueForString: [String] = []
    
    mutating func enqueueForInt(element: Int) {
        queueForInt.append(element)
    }
    
    mutating func enqueueForString(element: String) {
        queueForString.append(element)
    }
}
