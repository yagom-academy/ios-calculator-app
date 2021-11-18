
import Foundation

struct CalculatorItemQueue<Element: CalculateItem> {
    private var inputStack = [Element]()
    private var outputStack = [Element]()
    
    init(_ items: [Element] = []) {
        self.inputStack = items
    }
    
    var front: Element? {
        return outputStack.last ?? inputStack.first
    }
    
    var count: Int {
        return inputStack.count + outputStack.count
    }
    
    var isEmpty: Bool {
        return inputStack.isEmpty && outputStack.isEmpty
    }
    
    mutating func enqueue(_ element: Element) {
        inputStack.append(element)
    }
    
    @discardableResult
    mutating func dequeue() throws -> Element {
        if inputStack.isEmpty && outputStack.isEmpty {
            throw CalculateError.emptyQueue
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
