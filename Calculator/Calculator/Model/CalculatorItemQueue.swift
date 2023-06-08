//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by karen on 2023/06/07.
//

struct CalculatorItemQueue<Element: CalculateItem> {
   private var list: LinkedList<Element> = LinkedList()
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    mutating func enqueue(_ element: Element) {
        list.append(data: element)
    }
    
    mutating func dequeue() -> Element? {
        guard let first = list.first else { return nil }
        list.removeFirst()
        return first
    }
}
