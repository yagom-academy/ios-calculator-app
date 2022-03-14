//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by DuDu on 2022/03/14.
//

struct CalculatorItemQueue<Element> {
    private var list = LinkedList<Element>()
    
    var isEmpty: Bool {
        list.isEmpty
    }
    
    func enqueue(_ data: Element) {
        list.append(data)
    }
    
    func dequeue() -> Element? {
        list.removeFirst()
    }
    
    func allElement() -> [Element] {
        list.allElement()
    }
}
