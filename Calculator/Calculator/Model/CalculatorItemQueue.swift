//
//  CalculatorItemQueue.swift
//  Created by 미니.
//

protocol CalculateItem { }

extension Int: CalculateItem { }
extension Double: CalculateItem { }

struct CalculatorItemQueue<Element: CalculateItem> {
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
        
        return outputStack.removeLast()
    }
    
    func peek(_ index: Int) -> Element? {
        let values = outputStack + inputStack.reversed()
        return values.reversed()[index]
    }
}
