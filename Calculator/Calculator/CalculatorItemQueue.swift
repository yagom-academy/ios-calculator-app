//  Created by bella on 2022/09/19.

struct CalculatorItemQueue<T: CalculateItemProtocol> {
    private var leftStack: [T] = []
    private var rightStack: [T] = []
    
    @discardableResult mutating func enqueue(element: T) -> [T] {
        rightStack.append(element)
        return rightStack
    }
    
    mutating func dequeue() -> T? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        return leftStack.popLast()
    }
    
    mutating func count() -> Int {
        return leftStack.count + rightStack.count
    }
    
    func isEmpty() -> Bool {
        return leftStack.isEmpty && rightStack.isEmpty
    }
    
    mutating func clear() {
        leftStack.removeAll()
        rightStack.removeAll()
    }
    
    mutating func peek() -> T? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        guard leftStack.count != 0 else { return nil }
        return leftStack[leftStack.count - 1]
    }
}

