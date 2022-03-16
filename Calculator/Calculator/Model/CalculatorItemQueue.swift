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
}
