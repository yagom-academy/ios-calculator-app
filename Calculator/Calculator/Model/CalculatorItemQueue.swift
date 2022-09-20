//
//  CalculatorItemQueue.swift
//  Created by 미니.
//

protocol CalculatorItem { }

struct CalculatorItemQueue {
    
    var isEmpty: Bool {
        return false
    }
    
    @discardableResult
    func enqueue(_ n: Int) -> Bool {
        return false
    }
    
    @discardableResult
    func dequeue() -> Int? {
        return nil
    }
}
