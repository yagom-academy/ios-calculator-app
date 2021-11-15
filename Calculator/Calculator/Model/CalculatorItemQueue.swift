//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 박병호 on 2021/11/08.
//

import Foundation

struct CalculatorItemQueue<T>: CalculateItem {
    var linkeList = LinkedList<T>()
    
    var isEmpty: Bool {
        return linkeList.isEmpty()
    }
    
    mutating func enQueue(_ data: T?) {
        linkeList.append(data)
    }
    
    @discardableResult
    mutating func deQueue() throws -> T {
        return try linkeList.removeLast()
    }
    
    mutating func removeAll() {
        linkeList.removeAll()
    }
    
    mutating func returnQueue() -> Array<T> {
        return linkeList.returnList()
    }
}
