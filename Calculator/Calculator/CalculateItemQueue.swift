//
//  CalculateItemQueue.swift
//  Calculator
//
//  Created by 권나영 on 2021/11/09.
//

import Foundation

struct CalculateItemQueue<T>: CalculateItem {
    var enqueueArray: [T] = []
    var dequeueArray: [T] = []
    
    mutating func enqueue(element: T) {
        enqueueArray.append(element)
    }
    
    mutating func dequeue() -> T? {
        if enqueueArray.isEmpty, dequeueArray.isEmpty {
            return nil
        }
        if dequeueArray.isEmpty {
            dequeueArray = enqueueArray.reversed()
            enqueueArray.removeAll()
        }
        return dequeueArray.removeLast()
    }
}
