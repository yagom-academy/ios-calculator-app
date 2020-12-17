class BinaryOperator: BinaryToken {
    enum `Operator`: String, CaseIterable {
        case bitwiseNOT = "~"
        case bitwistLeftShift = "<<"
        case bitwiseRightShift = ">>"
        case bitwiseAND = "&"
        case bitwiseOR = "|"
        case bitwiseXOR = "^"
        case bitwiseNAND = "↑"
        case bitwiseNOR = "↓"
        case addition = "+"
        case substraction = "-"
    }
    
    let value: `Operator`
    
    init(value: `Operator`, priority: BinaryOperatorPrecedence) {
        self.value = value
        super.init(priority: priority)
    }
    
    static func getOperatorPrecedence(`operator`: `Operator`) -> BinaryOperatorPrecedence {
        switch `operator` {
        case .bitwiseNOT:
            return .highest
        case .bitwistLeftShift, .bitwiseRightShift:
            return .high
        case .bitwiseAND, .bitwiseOR, .bitwiseXOR, .bitwiseNAND, .bitwiseNOR:
            return .middle
        case .addition, .substraction:
            return .low
        }
    }
    
    static func convertStringOperatorToBinaryOperator(`operator`: String) -> `Operator`? {
        switch `operator` {
        case "~":
            return .bitwiseNOT
        case "<<":
            return .bitwistLeftShift
        case ">>":
            return .bitwiseRightShift
        case "&":
            return .bitwiseAND
        case "|":
            return .bitwiseOR
        case "^":
            return .bitwiseNOT
        case "↑":
            return .bitwiseNAND
        case "↓":
            return .bitwiseNOR
        case "+":
            return .addition
        case "-":
            return .substraction
        default:
            return nil
        }
    }
}
