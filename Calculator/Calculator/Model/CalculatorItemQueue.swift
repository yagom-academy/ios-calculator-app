//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Marisol Mirim Kim on 2022/03/15.
//

import Foundation

struct CalculatorItemQueue<T: CalculateItem> {
    var queue: Array<T?> = [T?]()
    var head: Int = 0
    var isEmpty: Bool {
        return queue.isEmpty
    }
    var count: Int {
        return queue.count
    }
    
    mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    mutating func dequeue() -> T? {
        // index로 쓰일 head가 queue의 count보다 작아야하고, element에 queue의 head번째 값을 할당한다
        guard head < queue.count, let element = queue[head] else {
            return nil
        }
        
        // 현재의 head를 nil처리한다
        queue[head] = nil
        
        // head를 1증가시켜 포인터를 바꾼다
        head += 1
        
        // nil처리되어 있는 값들이 50개가 넘으면 remove처리한다
        if head > 50 {
            queue.removeFirst(head)
            head = 0
        }
        return element
    }
}

protocol CalculateItem {
    
}
