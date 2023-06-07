//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by MARY on 2023/05/30.
//

struct CalculatorItemQueue<Item: CalculateItem> {
    private var queue = LinkedList<Item>()
    var peek: Item? { return queue.peek }
    var size: Int { return queue.size }
    var isEmpty: Bool { return queue.isEmpty }
    
    mutating func enqueue(_ item: Item) {
        queue.append(item)
    }
    
    mutating func dequeue() -> Item? {
        return queue.removeFirst()
    }
    
    mutating func removeAll() {
        queue.removeAll()
    }
}
