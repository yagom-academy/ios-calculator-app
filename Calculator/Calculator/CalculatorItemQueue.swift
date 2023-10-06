//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by jyubong on 2023/10/03.
//

struct CalculatorItemQueue<Element: CalculatorItem> {
    private var list: LinkedList<Element> = LinkedList()
    
    var front: Element? {
        return list.head?.data
    }
    
    var rear: Element? {
        return list.tail?.data
    }
    
    var count: Int {
        return list.count
    }
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    init(list: LinkedList<Element>) {
        self.list = list
    }
    
    mutating func enQueue(_ element: Element) {
        list.append(element)
    }
    
    @discardableResult
    mutating func deQueue() -> Element? {
        return isEmpty ? nil : list.removeFirst()
    }
    
    mutating func clear() {
        list.removeAll()
    }
}
