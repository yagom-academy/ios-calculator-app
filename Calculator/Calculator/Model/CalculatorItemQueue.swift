import Foundation

protocol CalculateItem {}

struct CalculatorItemQueue<Element: CalculateItem> {
    private var enqueueStack: [Element] = []
    private var dequeueStack: [Element] = []
    
    var isEmpty: Bool {
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }
}
