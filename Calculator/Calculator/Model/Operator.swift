enum Operator: Character, CaseIterable, CalculatorItem {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
    
    var symbol: Character {
        switch self {
        case .add:
            return Operator.add.rawValue
        case .subtract:
            return Operator.subtract.rawValue
        case .divide:
            return Operator.divide.rawValue
        case .multiply:
            return Operator.multiply.rawValue
        }
    }
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add:
            return add(lhs: lhs, rhs: rhs)
        case .subtract:
            return subtract(lhs: lhs, rhs: rhs)
        case .divide:
            do {
                return try divide(lhs: lhs, rhs: rhs)
            } catch CalculatorError.devideByZero {
                return .nan
            } catch {
                print(error)
                return .nan
            }
        case .multiply:
            return multiply(lhs: lhs, rhs: rhs)
        }
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
    
    private func divide(lhs: Double, rhs: Double) throws -> Double {
        if rhs == 0 {
            throw CalculatorError.devideByZero
        }
            
        return lhs / rhs
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
}
