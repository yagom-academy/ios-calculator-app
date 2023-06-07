//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by karen on 2023/06/07.
//

struct CalculatorItemQueue<T: CalculateItem> {
   private var list: CalculatorItemQueueLinkedList<T> = CalculatorItemQueueLinkedList()
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    mutating func enqueue(_ element: T) {
        list.append(data: element)
    }
    
    mutating func dequeue() -> T? {
        guard let first = list.first else { return nil }
        list.removeFirst()
        return first
    }
}
