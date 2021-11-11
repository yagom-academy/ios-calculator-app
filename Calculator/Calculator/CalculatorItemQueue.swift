
import Foundation

struct CalculatorItemQueue<Element>: CalculateItem {
    private var inputStack = [Element]()
    private var outputStack = [Element]()
    
    var front: Element? {
        return outputStack.last ?? inputStack.first
    }
    
    var count: Int {
        return outputStack.count
    }
    
    var isEmpty: Bool {
        return inputStack.isEmpty && outputStack.isEmpty
    }
    
    mutating func enqueue(_ element: Element) {
        inputStack.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> Element? {
        if inputStack.isEmpty && outputStack.isEmpty {
            return nil
        }
        
        if outputStack.isEmpty {
            outputStack = inputStack.reversed()
            inputStack.removeAll()
        }
            
        return outputStack.removeLast()
    }
    
    mutating func clear() {
        inputStack.removeAll()
        outputStack.removeAll()
    }
}
