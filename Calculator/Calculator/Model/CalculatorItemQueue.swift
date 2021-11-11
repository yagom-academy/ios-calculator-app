import Foundation

struct CalculatorItemQueue {
    var queue: [CalculateItem] = []
    
    mutating func enqueue(_ item: CalculateItem) {
        queue.append(item)
    }
    
    mutating func allClear() {
        self.queue = []
    }
    
    func calculate() -> Double {
        var result: Double = 0
        
        for item in queue {
            switch item {
            case let adder as Adder:
                result = adder.calculate(originalValue: result)
            case let subtractor as Subtractor:
                result = subtractor.calculate(originalValue: result)
            case let multiplier as Multiplier:
                result = multiplier.calculate(originalValue: result)
            case let divider as Divider:
                result = divider.calculate(originalValue: result)
            default:
                break
            }
        }
        
        return result
    }
}
