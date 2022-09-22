enum Operator: Character {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
    
    func calculate(rhs: Double, lhs: Double) -> Double {
        if self == .add {
            return rhs + lhs
        } else if self == .subtract {
            return rhs - lhs
        } else if self == .divide {
            return rhs / lhs
        } else {
            return rhs * lhs
        }
    }
}
