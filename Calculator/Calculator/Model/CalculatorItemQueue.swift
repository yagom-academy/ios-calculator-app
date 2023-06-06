//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 박종화 on 2023/05/30.
//

struct CalculatorItemQueue<Element: CalculatorItem> {
    private var outStack: [Element] = []
    private var inStack: [Element] = []
    
    internal var count: Int {
        let stackCount = outStack + inStack
        return stackCount.count
    }
    
    internal var isEmpty: Bool {
        return outStack.isEmpty
    }
    
    internal var peek: Element? {
        return !outStack.isEmpty ? outStack.last : inStack.first
    }
    
    internal mutating func enqueue(_ element: Element) {
        inStack.append(element)
    }
    
    internal mutating func dequeue() -> Element? {
        if outStack.isEmpty {
            outStack = inStack.reversed()
            inStack.removeAll()
        }
        return outStack.popLast()
    }
    
    internal mutating func clear() {
        inStack.removeAll()
        outStack.removeAll()
    }
}

extension CalculatorItemQueue: CustomStringConvertible {
    public var description: String {
        let printList = outStack.reversed() + inStack
        
        return String(describing: printList)
    }
}
