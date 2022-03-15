//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 김태훈 on 2022/03/15.
//
import Foundation

struct CalculatorItemQueue<T> {
    private var list = [T?]()
    private var head: Int = 0
    
    public var isEmpty: Bool {
        return list.isEmpty
    }
    
    public var count: Int {
        return list.count
    }
    
    public mutating func enqueue(_ element: T) {
        return list.append(element)
    }
    
    public mutating func dequeue() -> T? {
        guard head <= list.count, let element = list[head] else {
            if head > 100 {
                list.removeFirst(head)
                head = 0
            }
            
            list[head] = nil
            return list[head]
            head += 1
        }
        return element
    }
}


