import Foundation

protocol CalculateItem {
}

struct Adder: CalculateItem {
    let value: Double
    func calculate(originalValue: Double) -> Double {
        return originalValue + self.value
    }
}

struct Subtractor: CalculateItem {
    let value: Double
    func calculate(originalValue: Double) -> Double {
        return originalValue - self.value
    }
}

struct Multiplier: CalculateItem {
    let value: Double
    func calculate(originalValue: Double) -> Double {
        return originalValue * self.value
    }
}

struct Divider: CalculateItem {
    let value: Double
    func calculate(originalValue: Double) -> Double {
        return originalValue / self.value
    }
}
