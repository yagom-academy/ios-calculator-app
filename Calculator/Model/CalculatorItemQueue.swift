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
        return list.compactMap{$0}.isEmpty
    }
    
    var count: Int {
        return list.count
    var first: T? {
        return list.first ?? nil
    }
    
    var last: T? {
        return list.last ?? nil
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
            return nil
        }
        list[head] = nil
        head += 1
        if head > 100 {
            list.removeFirst(head)
            head = 0
        }
        return element
    }
}

extension Double: CalculateItem {
}


