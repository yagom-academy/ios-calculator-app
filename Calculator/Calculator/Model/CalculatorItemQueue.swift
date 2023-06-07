//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Whales on 2023/05/31.
//

import UIKit

struct CalculatorItemQueue<Element: CalculateItem>: Queueable {
    var queue: LinkedList = LinkedList<Element>()
    
    var count: Int {
        return queue.count
    }
    
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    mutating func enqueue(_ element: Element) {
        queue.append(data: element)
    }
    
    mutating func dequeue() -> Element? {
        let data = queue.readHeadData()
        queue.removeFirst()
        return data
    }
    
    mutating func clearQueue() {
        queue.removeAll()
    }
    
    func readFirstData() -> Element? {
        return queue.readHeadData()
    }
    
    func readLastData() -> Element? {
        return queue.readTailData()
    }
}
