import UIKit
struct CalculatorItemQueue {
    var array: [CalculateItem] = []
    
    mutating func enqueue(_ value: CalculateItem) {
        array.append(value)
    }
    
    mutating func dequeue() -> CalculateItem? {
        if array.isEmpty {
            return nil
        }
        return array.removeFirst()
    }
}

protocol CalculateItem { }

struct NumberItem: CalculateItem {
    var value: Double
}

struct OperatorItem: CalculateItem {
    var operation: (Double, Double) -> Double
}
