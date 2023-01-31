//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by jiye Yi on 2023/01/25.
//

struct CalculatorItemQueue<Item: CalculateItemProtocol> {
    private(set) var items: [Item] = []
    private(set) var reversedItems: [Item] = []
    
    var isEmpty: Bool {
        return items.isEmpty && reversedItems.isEmpty
    }
    
    mutating func enqueue(_ value: Item) {
        items.append(value)
    }
    
    mutating func dequeue() -> Item? {
        if reversedItems.isEmpty {
            reversedItems = items.reversed()
            items.removeAll()
        }
        return reversedItems.popLast()
    }
    
}
