
import Foundation

struct CalculatorItemQueue<T> {
    
    private(set) var queue:[T] = []
    
    mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
}
