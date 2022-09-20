//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 서현웅 on 2022/09/20.
//

import Foundation

protocol CalculateItem {
}

struct CalculatorItemQueue<T>: CalculateItem {
    private var queue: [T] = []
    
    public var count: Int {
        return queue.count
    }
    
    public var isEmpty: Bool {
        return queue.isEmpty
    }
    
    // queue의 맨뒤에 새로운 요소를 추가하는 메서드
    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    // queue의 첫번째 요소를 반환하고 제거하는 메서드
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : queue.removeFirst()
    }
