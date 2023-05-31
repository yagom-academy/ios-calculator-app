//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Daehoon Lee on 2023/05/31.
//

import Foundation

struct CalculatorItemQueue<T> {
    var linkedList: LinkedList<T> = LinkedList()
    
    mutating func enqueue(_ element: T) {
        linkedList.append(element)
    }
}
