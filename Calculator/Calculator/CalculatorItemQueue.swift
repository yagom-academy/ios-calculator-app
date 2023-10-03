//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by jyubong on 2023/10/03.
//

struct CalculatorItemQueue<T: CalculatorItem> {
    private let list: CalculatorItemQueueLinkedList<T> = CalculatorItemQueueLinkedList()
    
    var isEmpty: Bool
    
    func enQueue(_ item: T) {
        
    }
    
    func deQueue() {
        
    }
}
