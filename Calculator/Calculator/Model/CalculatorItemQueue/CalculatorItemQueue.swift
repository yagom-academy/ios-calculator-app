//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by karen, Mary.
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
}
