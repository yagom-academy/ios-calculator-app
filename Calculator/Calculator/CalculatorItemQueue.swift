//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by si won kim on 2021/11/09.
//

import Foundation

protocol CalculateItem {
    
}

extension Int : CalculateItem {
    
}

class CalculatorItemQueue<T: CalculateItem> {
    var calculatorItems = [T]()
    var temporaryItems = [T]()
    
    func enqueue(_ item: T) -> [T] {
        calculatorItems.append(item)
        return calculatorItems
    }
    
    func dequeue() -> [T] {
        temporaryItems = calculatorItems.reversed()
        temporaryItems.removeLast()
        calculatorItems = temporaryItems.reversed()
        return calculatorItems
    }
}
