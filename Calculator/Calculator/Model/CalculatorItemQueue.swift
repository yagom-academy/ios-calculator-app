//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 송종환 on 2023/01/25.
//

import Foundation

struct CalculatorItemQueue<T>: CalculateItem {
    
    private(set) var enqueueStack: [T] = []
    private(set) var dequeueStack: [T] = []

    var currentStackCount: Int {
        return enqueueStack.count + dequeueStack.count
    }
        
    var isEmpty: Bool {
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }
    // 모든 저장데이터를 초기화하려면 removeAll 필요하지않을까 추가함
    mutating func removeAll() {
        enqueueStack.removeAll()
        dequeueStack.removeAll()
        return
    }
    
    mutating func enqueueItem(_ element: T) {
        enqueueStack.append(element)
    }

    @discardableResult
    mutating func dequeueItem() -> T? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        return dequeueStack.popLast()
    }
}
