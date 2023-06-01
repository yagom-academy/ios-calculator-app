//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by redmango1446 on 2023/05/30.
//

struct CalculatorItemQueue<T>: CalculateItem {
    var CalculatorQueue: LinkedList<T> = LinkedList()
    
    func dequeue() -> T? {
        return CalculatorQueue.popFirst()
    }
}
