//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Min Hyun on 2023/05/29.
//

class CalculatorItemQueue {
    var head: CalculatorItemNode?
    var last: CalculatorItemNode?
    
    func append() {}
    func removeLast() {}
    func pop() {}
}

class CalculatorItemNode {
    var value: CalculateItem
    var next: CalculatorItemNode?
    
    init(_ value: CalculateItem) {
        self.value = value
    }
}
