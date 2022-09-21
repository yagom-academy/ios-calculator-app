//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by junho lee on 2022/09/20.
//

class CalculatorItemQueue<T: CalculateItem> {
    private var enqueueStack: Array<T> = []
    private var dequeueStack: Array<T> = []
    
    func enqueue(_ element: T) {
        enqueueStack.append(element)
    }
    
    func dequeue() -> T? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        return dequeueStack.popLast()
    }
}
