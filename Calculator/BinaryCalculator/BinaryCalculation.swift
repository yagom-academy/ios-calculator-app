struct BinaryCalculation {
    static func calculate(_ lhs: Int, _ rhs: Int, _ `operator`: BinaryOperator.Operator) -> Int {
        switch `operator` {
        case .bitwiseNOT:
            return ~lhs
        case .bitwistLeftShift:
            return lhs << rhs
        case .bitwiseRightShift:
            return lhs >> rhs
        case .bitwiseAND:
            return lhs & rhs
        case .bitwiseOR:
            return lhs | rhs
        case .bitwiseXOR:
            return lhs ^ rhs
        case .bitwiseNAND:
            return ~(lhs & rhs)
        case .bitwiseNOR:
            return ~(lhs | rhs)
        case .addition:
            return lhs + rhs
        case .substraction:
            return lhs - rhs
        }
    }
}
