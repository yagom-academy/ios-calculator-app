//MARK: - Operator
enum Operator: Character {
//MARK: - Operator Case
    case add = "+"
    case subtract = "−"
    case divide = "÷"
    case multiply = "×"
//MARK: - Operator Method
    func calculate(_ lhs: Double, _ rhs: Double) -> Double {
        let calculateResult: Double
        
        switch self {
        case .add:
            calculateResult = add(lhs, rhs)
        case .subtract:
            calculateResult = subtract(lhs, rhs)
        case .divide:
            calculateResult = divide(lhs, rhs)
        case .multiply:
            calculateResult = multiply(lhs, rhs)
        }
        
        return calculateResult
    }
    
    private func add(_ lhs: Double,_ rhs: Double) -> Double {
        return lhs + rhs
    }
    
    private func subtract(_ lhs: Double,_ rhs: Double) -> Double {
        return lhs - rhs
    }
    
    private func divide(_ lhs: Double,_ rhs: Double) -> Double {
        return lhs / rhs
    }
    
    private func multiply(_ lhs: Double,_ rhs: Double) -> Double {
        return lhs * rhs
    }
}
//MARK: - Extension
extension Operator: CaseIterable {}

extension Operator: CalculateItem {}
