import Foundation

enum Priority {
    static let lowPriority = 10
    static let highPriority = 100
}

enum Operator: String, Comparable {
    case plus = "+"
    case minus = "−"
    case multiply = "×"
    case divide = "÷"
    
    var operatorSymbol: String {
        self.rawValue
    }
    
    var priority: Int {
        switch self {
        case .plus, .minus:
            return Priority.lowPriority
        case .multiply, .divide:
            return Priority.highPriority
        }
    }
    
    static func < (lhs: Operator, rhs: Operator) -> Bool {
        lhs.priority < rhs.priority
    }
    
    static func == (lhs: Operator, rhs: Operator) -> Bool {
        lhs.priority == rhs.priority
    }
}

