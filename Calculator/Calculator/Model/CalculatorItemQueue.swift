//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by junho lee on 2022/09/20.
//

final class CalculatorItemQueue<T: CalculateItem> {
    private var enqueueStack: Array<T> = []
    private var dequeueStack: Array<T> = []
    
    func enqueue(_ element: T) {
        enqueueStack.append(element)
    }
    
    @discardableResult
    func dequeue() -> T? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        return dequeueStack.popLast()
    }
}
