//
//  CalculateItemQueue.swift
//  Calculator
//
//  Created by 노유빈 on 2022/10/03.
//

struct CalculatorItemQueue<Type: CalculateItem> {
    private var enqueueStack: [Type] = []
    private var dequeueStack: [Type] = []
    
    mutating func push(_ element: Type) {
        enqueueStack.append(element)
    }
    
    mutating func push(_ elements: [Type]) {
        elements.forEach { push($0) }
    }
    
    mutating func pop() -> Type? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        
        return dequeueStack.popLast()
    }
    
}
