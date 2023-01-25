//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by jiye Yi on 2023/01/25.
//

struct CalculatorItemQueue<T: Equatable> {
    var input: [T] = []
    var output: [T] = []
    
    var isEmpty: Bool {
        return input.isEmpty && output.isEmpty
    }
    
    var count: Int {
        return input.count + output.count
    }
    
    var peek: T? {
        return output.isEmpty ? input.first : output.last

    }
    
    mutating func enqueue(_ value: T) {
        input.append(value)
    }
    
    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        return output.removeLast()
    }
}
