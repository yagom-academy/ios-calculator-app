import Foundation

protocol CalculateItem {}

struct CalculatorItemQueue<Element: CalculateItem> {
    var enqueueStack: [Element] = []
    var dequeueStack: [Element] = []
    
    var isEmpty: Bool {
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }
    
    mutating func enqueue(_ newElement: Element) {
        enqueueStack.append(newElement)
    }
    
    mutating func dequeue() -> Element {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
        }
        
        return dequeueStack.removeLast()
    }
    
    mutating func clear() {
        enqueueStack.removeAll()
        dequeueStack.removeAll()
    }
}
