//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 조민호 on 2022/03/15.
//

import Foundation

struct CalculatorItemQueue<Int> {
    private var inputStack: [Int] = []
    
    var currentInputStack: [Int] {
        return inputStack
    }
    
    mutating func enqueue(_ element: Int) {
        inputStack.append(element)
    }
}
