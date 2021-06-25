import Foundation

enum Operator: String, Comparable {
    case plus = "+"
    case minus = "-"
    case times = "*"
    case divide = "/"
    
    var precedence: Int {
        let higherPrecedence = 1
        let lowerPrecedence = 0
        
        switch self {
        case .plus, .minus:
        return lowerPrecedence
        case .times, .divide:
        return higherPrecedence
        }
    }
    
    func calculate(lhs: Double, rhs: Double) throws -> Double {
        switch self {
        case .plus:
            return lhs + rhs
        case .minus:
            return lhs - rhs
        case .times:
            return lhs * rhs
        case .divide:
            if rhs == 0 {
                throw ErrorCases.dividedByZero
            }
            return lhs / rhs
        }
    }
    
    static func < (lhs: Operator, rhs: Operator) -> Bool {
        return lhs.precedence < rhs.precedence
    }
}
