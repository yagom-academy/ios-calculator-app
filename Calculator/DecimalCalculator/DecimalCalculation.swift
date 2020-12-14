struct DecimalCalculation {
    static func calculate(_ lhs: Int, _ rhs: Int, _ `operator`: DecimalOperator.Arithmetic) -> Int {
        switch `operator` {
        case .addition:
            return lhs + rhs
        case .substraction:
            return lhs - rhs
        case .multiplication:
            return lhs * rhs
        case .division:
            return lhs / rhs
        }
    }
    
    static func calculate(_ lhs: Int, _ rhs: Double, _ `operator`: DecimalOperator.Arithmetic) -> Double {
        switch `operator` {
        case .addition:
            return Double(lhs) + rhs
        case .substraction:
            return Double(lhs) - rhs
        case .multiplication:
            return Double(lhs) * rhs
        case .division:
            return Double(lhs) / rhs
        }
    }
    
    static func calculate(_ lhs: Double, _ rhs: Int, _ `operator`: DecimalOperator.Arithmetic) -> Double {
        switch `operator` {
        case .addition:
            return lhs + Double(rhs)
        case .substraction:
            return lhs - Double(rhs)
        case .multiplication:
            return lhs * Double(rhs)
        case .division:
            return lhs / Double(rhs)
        }
    }
    
    static func calculate(_ lhs: Double, _ rhs: Double, _ `operator`: DecimalOperator.Arithmetic) -> Double {
        switch `operator` {
        case .addition:
            return lhs + rhs
        case .substraction:
            return lhs - rhs
        case .multiplication:
            return lhs * rhs
        case .division:
            return lhs / rhs
        }
    }
}
