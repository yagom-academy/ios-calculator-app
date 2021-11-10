//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 황제하 on 2021/11/08.
//

import Foundation

struct CalculatorItemQueue<T> {
    let items: LinkedList<T> = LinkedList<T>()
    
    func enqueue(value: T) {
        items.addRear(value: value)
    }
}
