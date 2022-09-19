//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by jin on 9/19/22.
//

import Foundation

class CalculatorItemQueue {
    var queue: [String] = []
    
    func enqueue(item: String) {
        queue.append(item)
    }
}
