//
//  CalculateItemQueue.swift
//  Calculator
//
//  Created by yeha on 2021/11/09.
//

import Foundation

struct CalculateItemQueue<T: Equatable> {
    private(set) var items: [T] = []
    
    mutating func enqueue(_ item: T) {
    }

    mutating func dequeue() {
    }
    
    mutating func clean() {
    }
}
