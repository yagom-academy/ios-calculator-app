//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by jiye Yi on 2023/01/25.
//

struct CalculatorItemQueue<item: CalculateItemProtocol> {
    private(set) var itemArray: [item] = []
    private(set) var reversedItemArray: [item] = []
    
    var isEmpty: Bool {
        return itemArray.isEmpty && reversedItemArray.isEmpty
    }
    
    mutating func enqueue(_ value: item) {
        itemArray.append(value)
    }
    
    mutating func dequeue() -> item? {
        if reversedItemArray.isEmpty {
            reversedItemArray = itemArray.reversed()
            itemArray.removeAll()
        }
        return reversedItemArray.popLast()
    }
}
