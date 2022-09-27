//
//  CalculatorItemQueue.swift
//  Created by Wonbi
//

struct CalculatorItemQueue<T: CalculateItem> {
    private var input: [T] = []
    private var output: [T] = []
    
    var isEmpty: Bool {
        input.isEmpty && output.isEmpty
    }
    
    var count: Int {
        input.count + output.count
    }
    
    var statusQueue: [T] {
        guard output.isEmpty else {
            var reversedOutput: [T] = output.reversed()
            
            input.forEach { item in
                reversedOutput.append(item)
            }
            return reversedOutput
        }
        return input
    }
    
    mutating func enqueue(_ element: T) {
        input.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        return output.popLast()
    }
}
