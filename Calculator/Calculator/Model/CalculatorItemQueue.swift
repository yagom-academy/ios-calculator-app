//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by DuDu on 2022/03/14.
//

import UIKit

struct CalculatorItemQueue<Element: CalculateItem> {
    private let list = LinkedList<Element>()
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    func enqueue(_ data: Element) {
        list.append(data)
    }
    
    func dequeue() -> Element? {
        list.removeFirst()
    }
    
    func removeAll() {
        list.removeAll()
    }
}


