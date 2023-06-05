//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Yetti on 2023/05/30.

struct CalculatorItemQueue<T: CalculateItem>: DoubleStackQueue {
    private var enqueueStack: [T] = []
    private var dequeueStack: [T] = []
    
    var isEmpty: Bool {
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }
    
    mutating func enqueue(_ element: T) {
        enqueueStack.append(element)
    }
    
    mutating func dequeue() -> T? {
        guard isEmpty == false else { return nil }
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        return dequeueStack.popLast()
    }
    
    func peek() -> T? {
        guard isEmpty == false else { return nil }
        if dequeueStack.count > 0 {
            return dequeueStack.last
        } else if enqueueStack.count > 0 {
            return enqueueStack.first
        }
        return nil
    }
    
    mutating func clear() {
        enqueueStack.removeAll()
        dequeueStack.removeAll()
    }
}

enum Operator: Character, CaseIterable {
    case add
    case subtract
    case divide
    case multiply
    
    func calculate(lhs: Double, rhs: Double) -> Double { }
    private func add(lhs: Double, rhs: Double) -> Double { }
    private func subtract(lhs: Double, rhs: Double) -> Double { }
    private func divide(lhs: Double, rhs: Double) -> Double { }
    private func multiply(lhs: Double, rhs: Double) -> Double { }
}


enum ExpressionParser {
    static func parse(from input: String) -> Formula {}
    private static func componentsByOpeators(from input: String) -> [String] { }
}

struct Formula {
    let operands: CalculatorItemQueue<Int>
    let operators: CalculatorItemQueue<String>
    
    func result() -> Double { }
}
