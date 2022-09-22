enum Operator: Character {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
    
    func calculate(rhs: Double, lhs: Double) -> Double {
        return rhs + lhs
    }
}
