import Foundation

enum Operator: String, Comparable {
    static let lowPriority = 10
    static let highPriority = 100
    
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
            return Operator.lowPriority
        case .multiply, .divide:
            return Operator.highPriority
        }
    }
    
    static func < (lhs: Operator, rhs: Operator) -> Bool {
        lhs.priority < rhs.priority
    }
    
    static func == (lhs: Operator, rhs: Operator) -> Bool {
        lhs.priority == rhs.priority
    }
}
