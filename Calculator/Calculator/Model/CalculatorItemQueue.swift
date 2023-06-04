//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Daehoon Lee on 2023/05/31.
//

struct CalculatorItemQueue<Element: CalculateItem> {
    var linkedList: LinkedList<Element> = LinkedList()
    
    mutating func enqueue(_ element: Element) {
        linkedList.append(element)
    }
    
    mutating func dequeue() -> Element? {
        return linkedList.removeFirst()
    }
}
