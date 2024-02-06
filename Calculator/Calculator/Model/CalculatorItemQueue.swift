//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by EUNJI CHOI on 2/5/24.
//

import Foundation

struct CalculatorItemQueue<Element>: CalculateItem where Element: Equatable {
    private var storage = [Element]()
    
    mutating func enqueue(_ input: Element) {
        storage.append(input)
    }
    
    mutating func dequeue() -> Element? {
        if isEmpty() {
            return nil
        } else {
            return storage.removeFirst()
        }
    }
    
    func isEmpty() -> Bool {
        return storage.isEmpty
    }
    
    mutating func clear() {
        storage.removeAll()
    }
    
    func getSize() -> Int {
        return storage.count
    }
    
    func contains(_ target: Element) -> Bool {
        return storage.contains(target)
    }
    
    func toArray() -> [Element] {
        return storage
    }
    
    func get(index: Int) -> Element? {
        guard index >= 0 && index < storage.count else {
            return nil
        }
        return storage[index]
    }
}
