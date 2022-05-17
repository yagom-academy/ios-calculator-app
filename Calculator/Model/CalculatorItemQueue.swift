//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by NAMU on 2022/05/17.
//

struct CalculatorItemQueue<T>: CalculatorItem {
    var List: LinkedList<T>?
    
    func enQueue(data: T) {
    }
    
    func deQueue() -> T? {
        return nil
    }
    
    func isEmpty() -> Bool {
        return false
    }
}
