import Foundation

enum Operator: String, Comparable {
    case plus = "+"
    case minus = "-"
    case multiply = "*"
    case divide = "/"
    
    var precedence: Int {
        let higherPrecedence = 1
        let lowerPrecedence = 0
        
        switch self {
        case .plus, .minus:
        return lowerPrecedence
        case .multiply, .divide:
        return higherPrecedence
        }
    }
    
    func calculate(leftOperand: Double, rightOperand: Double) -> Double {
        switch self {
        case .plus:
            return leftOperand + rightOperand
        case .minus:
            return leftOperand - rightOperand
        case .multiply:
            return leftOperand * rightOperand
        case .divide:
            if rightOperand == 0 {
                return Double.nan
            }
            return leftOperand / rightOperand
        }
    }
    
    static func < (lhs: Operator, rhs: Operator) -> Bool {
        return lhs.precedence < rhs.precedence
    }
    
    static func == (lhs: Operator, rhs: Operator) -> Bool {
        return lhs.precedence == rhs.precedence
    }
}
