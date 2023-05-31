//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by MARY on 2023/05/30.
//

final class Item {
    var data: String
    var next: Item?
    
    init(data: String, next: Item? = nil) {
        self.data = data
        self.next = next
    }
}

final class CalculatorItemQueue: CalculateItem {
    private var front: Item?
    private var tail: Item?
    private(set) var size: Int = 0
    var isEmpty: Bool { size == 0 }
    
    func enqueue(_ element: String) {
        let newItem = Item(data: element)
        
        if isEmpty {
            front = newItem
            tail = front
        } else {
            tail?.next = newItem
            tail = newItem
        }
        size += 1
    }
    
    func dequeue() -> String? {
        guard let result = front?.data else { return nil }
        
        front = front?.next
        size -= 1
        
        if isEmpty {
            front = nil
            tail = nil
        }
        
        return result
    }
    
    func resetQueue() {
        front = nil
        tail = nil
        size = 0
    }
    
    func takeQueueAsArray() -> [String]? {
        guard var _ = front else { return nil }
        var result: [String] = []
        var pointer = front
        
        while pointer != nil {
            if let data = pointer?.data {
                result.append(data)
            }
            pointer = pointer?.next
        }
        
        return result
    }
}
