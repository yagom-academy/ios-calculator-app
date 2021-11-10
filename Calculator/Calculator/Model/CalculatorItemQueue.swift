//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Jun Bang on 2021/11/10.
//

import Foundation

protocol CalculateItem {
    
}

struct CalculatorItemQueue<T: CalculateItem> {
    var list = LinkedList<T>()
    
    var first: T? {
        guard let firstItem = list.first else {
            return nil
        }
        return firstItem
    }
    
    var isNotEmpty: Bool {
        return list.isNotEmpty
    }
    
    mutating func enqueue(_ item: T) {
        list.append(item)
    }
}
