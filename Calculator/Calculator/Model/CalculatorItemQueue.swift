//
//  CalculatorItemQueue.swift
//  Created by 미니.
//

protocol CaculatorItem { }

extension Int: CaculatorItem { }
extension Double: CaculatorItem { }

struct CalculatorItemQueue<Element: CaculatorItem> {
    var inputStack: [Element] = []
    var outputStack: [Element] = []
    
    var isEmpty: Bool {
        return inputStack.isEmpty && outputStack.isEmpty
    }
    
    var front: Element? {
        return outputStack.first ?? inputStack.first
    }
    
    init() { }
    
    init(_ elements: [Element]) {
        self.inputStack = elements
    }
    
    mutating func enqueue(_ n: Element) {
        inputStack.append(n)
    }
    
    @discardableResult
    mutating func dequeue() -> Element {
        if outputStack.isEmpty {
            outputStack = inputStack.reversed()
            inputStack.removeAll()
        }
        
        return outputStack.removeFirst()
    }
    
    func peek(_ index: Int) -> Element? {
        let values = outputStack + inputStack.reversed()
        return values[index]
    }
}
