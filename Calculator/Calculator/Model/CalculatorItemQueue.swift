
import Foundation

struct CalculatorItemQueue<T> {
    
    private(set) var queue:[T] = []
    
    mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    mutating func dequeue() -> T? {
        if !queue.isEmpty {
            return queue.removeFirst()
        } else {
            return nil
        }
    }
    
    mutating func clearAll() {
        queue.removeAll()
    }
    
}
