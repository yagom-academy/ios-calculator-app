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
}
