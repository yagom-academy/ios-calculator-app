//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by MARY on 2023/05/30.
//

struct CalculatorItemQueue<Item>: Queueable {
    private var queue = LinkedList<Item>()
    var peek: Item? { queue.peek() }
    var size: Int { queue.size }
    var isEmpty: Bool { queue.isEmpty }
    
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
