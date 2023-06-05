//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 박종화 on 2023/05/30.
//
struct CalculatorItemQueue<Element> {
    private var leftStack: [Element] = []
    private var rightStack: [Element] = []
    
    internal var count: Int {
        let stackCount = leftStack + rightStack
        return stackCount.count
    }
    
    internal var isEmpty: Bool {
        return rightStack.isEmpty
    }
    
    internal var peek: Element? {
        return !leftStack.isEmpty ? leftStack.last : rightStack.first
    }
    
    internal mutating func enqueue(_ element: Element) {
        rightStack.append(element)
    }
    
    internal mutating func dequeue() -> Element? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        return leftStack.popLast()
    }
    
    internal mutating func clear() {
        rightStack.removeAll()
    }
}

extension CalculatorItemQueue: CustomStringConvertible {
    public var description: String {
        let printList = leftStack.reversed() + rightStack
        
        return String(describing: printList)
    }
}
