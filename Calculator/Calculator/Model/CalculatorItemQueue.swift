import Foundation

struct CalculatorItemQueue<T: CalculateItem> {
    var calculatorItems = [T]()
    
    mutating func enqueue(_ item: T) {
        calculatorItems.append(item)
    }
    
    mutating func dequeue() -> T? {
        guard calculatorItems.isEmpty == false else {
            return nil
        }
        
        calculatorItems = calculatorItems.reversed()
        let item = calculatorItems.removeLast()
        calculatorItems = calculatorItems.reversed()
        
        return item
    }
    
    mutating func removeAll() {
        calculatorItems.removeAll()
    }
    
    var numberOfItems: Int {
        return calculatorItems.count
    }
}
