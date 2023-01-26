//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by jiye Yi on 2023/01/25.
//

struct CalculatorItemQueue<item: CalculateItemProtocol> {
    var input: [item] = []
    var output: [item] = []
    
    var isEmpty: Bool {
        return input.isEmpty && output.isEmpty
    }
    
    var count: Int {
        return input.count + output.count
    }
    
    var peek: item? {
        return output.isEmpty ? input.first : output.last

    }
    
    mutating func enqueue(_ value: item) {
        input.append(value)
    }
    
    mutating func dequeue() -> item? {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        return output.popLast()
    }
}
