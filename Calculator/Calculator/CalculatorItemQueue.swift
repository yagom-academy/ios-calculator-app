struct CalculatorItemQueue {
    private(set) var items: LinkedList<CalculateItem> = LinkedList()
    
    mutating func enqueue(item: CalculateItem) {
        items.append(item)
    }
    
    mutating func dequeue() -> CalculateItem? {
        return items.removeFirst()
    }
}

protocol CalculateItem { }

struct NumberItem: CalculateItem, Equatable {
    var value: Double
}

struct OperatorItem: CalculateItem {
    var operation: (NumberItem, NumberItem) -> NumberItem
}

extension NumberItem: ExpressibleByFloatLiteral {
    init(floatLiteral value: FloatLiteralType) {
        self.value = value
    }
}

extension NumberItem: ExpressibleByIntegerLiteral {
    init(integerLiteral value: IntegerLiteralType) {
        self.value = Double(value)
    }
}
