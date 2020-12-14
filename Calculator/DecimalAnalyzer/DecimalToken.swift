class DecimalToken {
    private let priority: DecimalOperatorPrecedence
    
    init(priority: DecimalOperatorPrecedence) {
        self.priority = priority
    }
}

extension DecimalToken: Comparable {
    static func < (lhs: DecimalToken, rhs: DecimalToken) -> Bool {
        lhs.priority < rhs.priority
    }
    
    static func == (lhs: DecimalToken, rhs: DecimalToken) -> Bool {
        lhs.priority == rhs.priority
    }
}
