//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 김동용 on 2022/05/16.
//

//MARK: - CalculatorItemQueue
struct CalculatorItemQueue<Double>: Queue, CalculateItem {  //double?
    var leftStack: Array<Double> = []
    var rightStack: Array<Double> = []
    
    var isEmpty: Bool {
        return (leftStack.isEmpty && rightStack.isEmpty)
    }
    
    var peek: Double? {
        if !leftStack.isEmpty {
            return leftStack.first
        } else {
            return rightStack.last
        }
    }
    
    mutating func enQueue(_ double: Double) -> Bool {
        leftStack.append(double)
        return true
    }
    
    mutating func deQueue() -> Double? {
        if rightStack.isEmpty {
            rightStack = leftStack.reversed()
            leftStack.removeAll()
        }
        return rightStack.popLast()
    }
}
