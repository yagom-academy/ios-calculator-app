//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 김태훈 on 2022/03/15.
//
import Foundation

struct CalculatorItemQueue<T>:CalculateItem {
    var list = [T?]()
    var head: Int = 0
struct CalculatorItemQueue<T: CalculateItem> {
    private(set) var head: Int = 0
    
    var count: Int {
        return list.count
    }
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    var count: Int {
        return list.count
    }
    
    mutating func enqueue(value: T) {
        return list.append(value)
    }
    
    mutating func dequeue() -> T? {
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


