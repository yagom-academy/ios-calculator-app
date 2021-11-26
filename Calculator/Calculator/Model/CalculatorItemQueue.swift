import Foundation

class CalculatorItemQueue<T: CalculateItem> {
    private var calculatorItems = [T]()
    
    func enqueue(_ item: T) {
        calculatorItems.append(item)
    }
    
    func dequeue() -> T? {
        guard calculatorItems.isEmpty == false else {
            return nil
        }
        
        calculatorItems = calculatorItems.reversed()
        let item = calculatorItems.removeLast()
        calculatorItems = calculatorItems.reversed()
        
        return item
    }
    
    func removeAll() {
        calculatorItems.removeAll()
    }
    
    var numberOfItems: Int {
        return calculatorItems.count
    }
}
