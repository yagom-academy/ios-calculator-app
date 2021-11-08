import UIKit

protocol CalculateItem { }

struct NumberItem: CalculateItem {
    var value: Double
}

struct OperatorItem: CalculateItem {
    var operation: (NumberItem, NumberItem) -> NumberItem
}

struct CalculatorItemQueue {
    var numbers: [NumberItem] = []
    var operators: [OperatorItem] = []
    
    mutating func calculateAll() -> NumberItem {
        guard var result = dequeueNumber() else {
            return NumberItem(value: 0)
        }
        
        for `operator` in operators {
            guard let value = dequeueNumber() else {
                      break
                  }
            result = `operator`.operation(result, value)
        }
        
        return result
    }
    
    mutating func enqueue(_ value: NumberItem) {
        numbers.append(value)
    }
    
    mutating func enqueue(_ value: OperatorItem) {
        operators.append(value)
    }
    
    mutating func dequeueNumber() -> NumberItem? {
        if numbers.isEmpty {
            return nil
        }
        return numbers.removeFirst()
    }
    
    mutating func dequeueOperator() -> OperatorItem? {
        if operators.isEmpty {
            return nil
        }
        return operators.removeFirst()
    }
}

extension CalculatorItemQueue {
    mutating func enqueue(_ value: @escaping (NumberItem, NumberItem) -> NumberItem) {
        let item = OperatorItem(operation: value)
        operators.append(item)
    }
}

extension NumberItem: Equatable, ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.value == rhs.value
    }
    
    init(floatLiteral value: FloatLiteralType) {
        self.value = value
    }
    
    init(integerLiteral value: IntegerLiteralType) {
        self.value = Double(value)
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
