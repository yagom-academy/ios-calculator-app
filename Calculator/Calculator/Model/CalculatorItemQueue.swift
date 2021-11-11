//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by JeongTaek Han on 2021/11/09.
//

import Foundation

protocol CalculateItem { }

struct CalculatorItemQueue<Element> where Element: CalculateItem {
    private var items: LinkedList<Element>
    
    var count: Int {
        items.count
    }
    
    var isEmpty: Bool {
        items.isEmpty
    }
    
    var front: Element? {
        items.first
    }
    
    init() {
        items = LinkedList()
    }
    
    func enqueue(_ item: Element) {
        self.items.append(item)
    }
    
    @discardableResult
    func dequeue() -> Element? {
        items.removeFirst()
    }
}
