//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by hyunMac on 10/4/23.
//
import Foundation

struct CalculatorItemQueue<T: CalculatorItem> {
    private var list = LinkedList<T>()
    
    mutating func enqueue(_ elemnet: T) {
        list.enqueue(elemnet)
    }
    
    mutating func dequeue() -> T? {
        list.dequeue()
    }
    
    func peek() -> T? {
        list.peek()
    }
    
    mutating func isEmpty() -> Bool {
        list.isEmpty()
    }
    
    mutating func clear() {
        list.clear()
    }
    
    func count() -> Int {
        list.count()
    }
    
}


