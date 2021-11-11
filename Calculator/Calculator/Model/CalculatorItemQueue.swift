//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by si won kim on 2021/11/09.
//

import Foundation

protocol CalculateItem {
    
}

extension Character: CalculateItem {
    
}

class CalculatorItemQueue<T: CalculateItem> {
    var calculatorItems = [T]()
    
    func enqueue(_ item: T) {
        calculatorItems.append(item)
    }
    
    func dequeue() -> T? {
        var temporaryItems = [T]()
        
        guard calculatorItems.isEmpty == false else {
            return nil
        }
        temporaryItems = calculatorItems.reversed()
        temporaryItems.removeLast()
        calculatorItems = temporaryItems.reversed()
        temporaryItems.removeAll()
        
        let firstItem = temporaryItems.last
        
        return firstItem
    }
    
    func removeAll() {
        calculatorItems.removeAll()
    }
}
