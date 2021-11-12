
import Foundation

enum Operation: Character, CaseIterable {
    case add = "+"
    case substract = "-"
    case divide = "/"
    case multiply = "*"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add:
            return self.add(lhs: lhs, rhs: rhs)
        case .substract:
            return self.substract(lhs: lhs, rhs: rhs)
        case .divide:
            return self.divide(lhs: lhs, rhs: rhs)
        case .multiply:
            return self.multifly(lhs: lhs, rhs: rhs)
        }
        
        }

func add(lhs: Double, rhs: Double) -> Double { lhs + rhs }
func substract(lhs: Double, rhs: Double) -> Double { lhs - rhs }
func divide(lhs: Double, rhs: Double) -> Double { lhs / rhs }
func multifly(lhs: Double, rhs: Double) -> Double { lhs * rhs }
}

