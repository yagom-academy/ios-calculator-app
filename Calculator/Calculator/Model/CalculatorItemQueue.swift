//  CalculatorItemQueue.swift
//  Calculator
//  Created by LIMGAUI on 2021/11/09.

import Foundation

struct CalculatorItemQueue<T: CalculatorItem> {
    private var array: [T] = []
    
    var bringArray: [T] {
        array
    }
    
    mutating func push(_ item: T) {
        array.append(item)
    }
    
    mutating func deleteFront() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    mutating func deleteRear() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeLast()
        }
    }
    
    mutating func deleteAll() {
        array.removeAll()
    }
    
    var arraySize: T {
        array.count as! T
    }
    
    var isEmpty: Bool {
        array.isEmpty
    }
}
