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
        return higherPrecedence
        case .times, .divide:
        return lowerPrecedence
        }
    }
    
    static func < (left: Operator, right: Operator) -> Bool {
        return left.precedence < right.precedence
    }
}
