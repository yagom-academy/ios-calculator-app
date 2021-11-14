//
//  Calculator.swift
//  Calculator
//
//  Created by 양호준 on 2021/11/08.
//

import Foundation

struct CalculatorItemQueue<Element: CalculateItem> {
    var array: [Element] = []
    var reversedArray: [Element] = []
    
    mutating func appendItem(_ item: Element) {
        array.append(item)
    }
    
    mutating func removeItem() throws -> [Element] {
        if array.isEmpty {
            throw QueueError.emptyArray
        }
        reversedArray = array.reversed()
        reversedArray.removeLast()
        array = reversedArray.reversed()
        
        return array
    }
    
    mutating func removeAllItems() throws {
        if array.isEmpty {
            throw QueueError.emptyArray
        }
        array.removeAll()
    }
}


