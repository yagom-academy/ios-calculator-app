//
//  CalcultaorItemQueue.swift
//  Calculator
//
//  Created by 1 on 2021/11/09.
//

import Foundation

protocol CalculateItem {
    
}

enum Operator: CalculateItem {
    case plus, minus, multiply, divide, equal
}

struct Number: CalculateItem {
    let num: Double
}

struct CalculatorItemQueue {
    var queue: [CalculateItem] = []
    
    mutating func enqueue(_ item: Int) {
        if let item = item as? CalculateItem {
        queue.append(item)
        }
    }
}
