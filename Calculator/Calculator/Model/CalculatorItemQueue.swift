
import Foundation

struct CalculatorItemQueue<T> {
    
    private(set) var inputStack:[T] = []
    private(set) var outputStack:[T] = []
    
    mutating func enqueue(_ element: T) {
        inputStack.append(element)
    }
    
    mutating func dequeue() -> T? {
        if outputStack.isEmpty {
            outputStack = inputStack.reversed()
            inputStack.removeAll()
        }
        
        return outputStack.popLast()
    }
    
    mutating func allClear() {
        inputStack.removeAll()
        outputStack.removeAll()
    }
    
}
