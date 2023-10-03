//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by jyubong on 2023/10/03.
//

struct CalculatorItemQueue<Element: CalculatorItem> {
    private let list: LinkedList<Element> = LinkedList()
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    func enQueue(_ item: Element) {
        
    }
    
    func deQueue() {
        
    }
}
