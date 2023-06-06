//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Daehoon Lee on 2023/05/31.
//

struct CalculatorItemQueue<Element: CalculateItem> {
    private var linkedList: LinkedList<Element> = LinkedList()
    var isEmpty: Bool {
        return linkedList.count == 0 ? false : true
    }
    
    mutating func enqueue(_ element: Element) {
        linkedList.append(element)
    }
    
    mutating func dequeue() -> Element? {
        return linkedList.removeFirst()
    }
}
