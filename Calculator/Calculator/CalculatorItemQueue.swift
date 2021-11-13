struct CalculatorItemQueue {
    private(set) var items: LinkedList<CalculateItem> = LinkedList()
    
    mutating func enqueue(item: CalculateItem) {
        items.append(item)
    }
    
    mutating func dequeue() -> CalculateItem? {
        return items.removeFirst()
    }
}

protocol CalculateItem { }

extension Double: CalculateItem { }

enum Operator: Character, CaseIterable {
    case add = "+"
    case subtract = "-"
    case divide = "÷"
    case multiply = "×"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add:
            return add(lhs: lhs, rhs: rhs)
        case .subtract:
            return subtract(lhs: lhs, rhs: rhs)
        case .multiply:
            return multiply(lhs: lhs, rhs: rhs)
        case .divide:
            return divide(lhs: lhs, rhs: rhs)
        }
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
    
    private func divide(lhs: Double, rhs: Double) -> Double {
        return lhs / rhs
    }
}
