//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Yetti on 2023/05/30.

import Foundation

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

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add:
            return add(lhs: lhs, rhs: rhs)
        case .subtract:
            return subtract(lhs: lhs, rhs: rhs)
        case .divide:
            return divide(lhs: lhs, rhs: rhs)
        case .multiply:
            return multiply(lhs: lhs, rhs: rhs)
        }
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
    
    private func divide(lhs: Double, rhs: Double) -> Double {
        return lhs / rhs
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
}

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula = Formula()
        let operands = componentsByOperators(from: input)
        let operators = Array(input.filter { $0.isNumber == false })
        
        for operand in operands {
            if let number = Double(operand) {
                formula.operands.enqueue(number)
            }
        }
        
        for `operator` in operators {
            if let oper = Operator(rawValue: `operator`) {
                formula.operators.enqueue(oper)
            }
        }

        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        return input.components(separatedBy: ["+", "-", "/", "*"])
    }
}

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue()
    
    func result() -> Double {
        return 0
    }
}
