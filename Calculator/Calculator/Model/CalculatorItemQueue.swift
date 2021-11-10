//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by LIMGAUI on 2021/11/09.

import Foundation

struct CalculatorItemQueue {
    private var nodes: [Int] = []
    
    func bringNodes() -> [Int] {
        nodes
    }
    
    mutating func push(_ item: Int) {
        nodes.append(item)
    }
    
    mutating func deleteFront() {
        nodes.removeFirst()
    }
    mutating func deleteRear() -> Int? {
        if isEmpty() {
            return nil
        } else {
            return nodes.removeLast()
        }
    }
    
    func isEmpty() -> Bool {
        nodes.isEmpty
    }
    func calculatorSize() -> Int {
        nodes.count
    }
}
