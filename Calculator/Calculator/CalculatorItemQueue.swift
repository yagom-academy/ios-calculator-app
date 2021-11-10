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
    
    func push(_ item: T) -> [T] {
        calculatorItems.append(item)
        return calculatorItems
    }
    
    func pop() -> [T] {
        calculatorItems.removeFirst()
        return calculatorItems
    }
}
