//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by karen on 2023/06/13.
//

struct CalculatorItemQueue<Element: CalculateItem> {
   private var list: LinkedList<Element> = LinkedList()
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    var first: Element? {
        return list.first
    }
    
    var last: Element? {
        return list.last
    }
    
    mutating func enqueue(_ element: Element) {
        list.append(data: element)
    }
    
    mutating func dequeue() -> Element? {
        return list.removeFirst()
    }
}

