//
//  Calculator.swift
//  Calculator
//
//  Created by 양호준 on 2021/11/08.
//

struct CalculatorItemQueue<Element: CalculateItem> {
    var items: [Element] = []
    var reversedItems: [Element] = []
    
    mutating func appendItem(_ item: Element) {
        items.append(item)
    }
    
    mutating func removeItem() throws -> [Element] {
        if items.isEmpty {
            throw QueueError.emptyItem
        }
        reversedItems = items.reversed()
        reversedItems.removeLast()
        items = reversedItems.reversed()
        
        return items
    }
    
    mutating func removeAllItems() throws {
        if items.isEmpty {
            throw QueueError.emptyItem
        }
        items.removeAll()
    }
}


