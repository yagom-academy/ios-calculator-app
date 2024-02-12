//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Jaehun Lee on 2/6/24.
//

extension Double: CalculateItem {
    
}

protocol CalculateItem {
    
}

protocol QueueProtocol: DataAccessable {
    mutating func enqueue(element: Element)
    mutating func dequeue() -> Element?
}

struct CalculatorItemQueue<Element: CalculateItem>: QueueProtocol {
    private var list = DoublyLinkedList<Element>()
    
    var count: Int {
        return list.count
    }
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    var first: Element? {
        return list.first
    }
    
    var last: Element? {
        return list.last
    }
    
    mutating func enqueue(element: Element) {
        list.addLast(element: element)
    }
    
    mutating func dequeue() -> Element? {
        return list.removeFirst()
    }
}

extension String {
    func split(with target: Character) -> [String] {
        return []
    }
}

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
    
    func calculate(lhs: Double, rhs: Double) throws -> Double {
        return 0.0
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        return 0.0
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        return 0.0
    }
    
    private func divide(lhs: Double, rhs: Double) throws -> Double {
        return 0.0
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return 0.0
    }
}

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    func result() -> Double {
        return 0.0
    }
}

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        return Formula(operands: CalculatorItemQueue(), operators: CalculatorItemQueue())
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        return []
    }
}
