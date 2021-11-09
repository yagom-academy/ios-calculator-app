//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by si won kim on 2021/11/09.
//

import Foundation

protocol CalculateItem {
    
}

struct CalculatorItemQueue {
    var calculatorItems = [Int]()
    mutating func push(_ item: Int) -> [Int] {
        calculatorItems.append(item)
        return calculatorItems
    }
}
