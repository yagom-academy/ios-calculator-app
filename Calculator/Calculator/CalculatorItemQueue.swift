import UIKit

protocol CalculateItem { }

struct NumberItem: CalculateItem {
    var value: Double
}

struct OperatorItem: CalculateItem {
    var operation: (Double, Double) -> Double
}

struct CalculatorItemQueue {
    var numbers: [NumberItem] = []
    var operators: [OperatorItem] = []
    
    mutating func calculateAll() -> Double {
        guard var result = dequeueNumber()?.value else {
            return 0
        }
        
        for `operator` in operators {
            guard let value = dequeueNumber() else {
                      break
                  }
            result = `operator`.operation(result, value.value)
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
    mutating func enqueue(_ value: Double) {
        let item = NumberItem(value: value)
        numbers.append(item)
    }
    
    mutating func enqueue(_ value: @escaping (Double, Double) -> Double) {
        let item = OperatorItem(operation: value)
        operators.append(item)
    }
}
