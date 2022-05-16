//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 김동용 on 2022/05/16.
//

//MARK: - CalculatorItemQueue
struct CalculatorItemQueue<T>: Queue {
    var isEmpty: Bool
    
    var peek: T?
    
    mutating func enQueue(_ T: T) -> Bool {
        return true
    }
    
    mutating func deQueue() -> T? {
        return T.self as? T
    }
}
