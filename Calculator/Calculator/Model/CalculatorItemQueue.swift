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
            result = item.calculate(originalValue: result)
        }
        
        return result
    }
}
