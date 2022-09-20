//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by SummerCat on 2022/09/20.
//

import Foundation

protocol CalculateItem {
    
}

struct CalculatorItemQueue {
    var inItems: [CalculateItem] = []
    var outItems: [CalculateItem] = []
    
    mutating func enqueue(item: CalculateItem) {
        inItems.append(item)
    }
}
