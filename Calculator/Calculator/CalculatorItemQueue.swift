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

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() throws -> Double {
        guard var result = operands.dequeue() else {
            return 0.0
        }
        
        while !operators.isEmpty {
            guard let `operator` = operators.dequeue(),
                  let operand = operands.dequeue() else {
                return 0.0
            }
            
            result = try `operator`.calculate(lhs: result, rhs: operand)
        }
        
        return result
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
