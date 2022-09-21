//  Created by bella on 2022/09/19.

struct CalculatorItemQueue<T: CalculateItemProtocol> {
    private(set) var dequeueStack: [T] = []
    private(set) var enqueueStack: [T] = []
    
    @discardableResult
    mutating func enqueue(element: T) -> [T] {
        enqueueStack.append(element)
        return enqueueStack
    }
    
    @discardableResult
    mutating func dequeue() -> T? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        return dequeueStack.popLast()
    }
    
    mutating func count() -> Int {
        return dequeueStack.count + enqueueStack.count
    }
    
    func isEmpty() -> Bool {
        return dequeueStack.isEmpty && enqueueStack.isEmpty
    }
    
    mutating func clear() {
        dequeueStack.removeAll()
        enqueueStack.removeAll()
    }
    
    
    mutating func peek() -> T? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
          return dequeueStack.last
    }
}

