struct UserFormula {
    var fullFormula: String = ""
    var isEmpty: Bool {
        return fullFormula.isEmpty
    }
    var isOnlyNumber: Bool {
        return Double(fullFormula) != nil
    }
    var isLastOperator: Bool {
        if let lastInput = fullFormula.last, Operator(rawValue: lastInput) != nil {
            return true
        }
        return false
    }
    
    mutating func append(content: String) {
        fullFormula += content
    }
    
    mutating func dropLast(count: Int = 1) {
        for _ in 1...count {
            fullFormula.removeLast()
        }
    }
    
    mutating func removeAll() {
        fullFormula.removeAll()
    }
}
