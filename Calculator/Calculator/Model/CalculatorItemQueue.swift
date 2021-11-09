//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by JeongTaek Han on 2021/11/09.
//

import Foundation

protocol CalculateItem { }

struct CalculatorItemQueue<Element> {
    var item: LinkedList<Element>
    
    init() {
        self.item = LinkedList()
    }
    
    func enqueue(_ item: Element) {
        
    }
    
    func dequeue() -> Element? {
        return nil
    }
}
