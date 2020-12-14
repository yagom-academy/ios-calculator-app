class BinaryToken {
    private let priority: BinaryOperatorPrecedence
    
    init(priority: BinaryOperatorPrecedence) {
        self.priority = priority
    }
}

extension BinaryToken: Comparable {
    static func < (lhs: BinaryToken, rhs: BinaryToken) -> Bool {
        lhs.priority < rhs.priority
    }
    
    static func == (lhs: BinaryToken, rhs: BinaryToken) -> Bool {
        lhs.priority == rhs.priority
    }
}
