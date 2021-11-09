protocol CalculateItem { }

struct NumberItem: CalculateItem {
    var value: Double
}

struct OperatorItem: CalculateItem {
    var operation: (NumberItem, NumberItem) -> NumberItem
}

struct CalculatorItemQueue {
    private(set) var items: [CalculateItem] = []
    
    mutating func enqueue(item: CalculateItem) {
        items.append(item)
    }
    
    mutating func dequeue() -> CalculateItem? {
        if items.isEmpty {
            return nil
        }
        return items.removeFirst()
    }
}

extension NumberItem: ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral, Equatable {
    init(floatLiteral value: FloatLiteralType) {
        self.value = value
    }
    
    init(integerLiteral value: IntegerLiteralType) {
        self.value = Double(value)
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.value == rhs.value
    }
    
    static func + (lhs: Self, rhs: Self) -> Self {
        let result = lhs.value + rhs.value
        return Self(value: result)
    }
    
    static func - (lhs: Self, rhs: Self) -> Self {
        let result = lhs.value - rhs.value
        return Self(value: result)
    }
    
    static func / (lhs: Self, rhs: Self) -> Self {
        let result = lhs.value / rhs.value
        return Self(value: result)
    }
    
    static func * (lhs: Self, rhs: Self) -> Self {
        let result = lhs.value * rhs.value
        return Self(value: result)
    }
}
