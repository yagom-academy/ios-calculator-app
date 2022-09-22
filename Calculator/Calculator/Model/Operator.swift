enum Operator: Character {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
    
    func calculate(_ rhs: Double, _ lhs: Double) -> Double {
        let calculateResult: Double
        switch self {
        case .add:
            calculateResult = add(rhs, lhs)
        case .subtract:
            calculateResult = subtract(rhs, lhs)
        case .divide:
            calculateResult = divide(rhs, lhs)
        case .multiply:
            calculateResult = multiply(rhs, lhs)
        }
        return calculateResult
    }
    
    private func add(_ rhs: Double,_ lhs: Double) -> Double {
        return rhs + lhs
    }
    
    private func subtract(_ rhs: Double,_ lhs: Double) -> Double {
        return rhs - lhs
    }
    
    private func divide(_ rhs: Double,_ lhs: Double) -> Double {
        return rhs / lhs
    }
    
    private func multiply(_ rhs: Double,_ lhs: Double) -> Double {
        return rhs * lhs
    }
}

extension Operator: CaseIterable {}

extension Operator: CalculateItem {}
