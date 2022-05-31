//
//  Queue.swift
//  Calculator
//
//  Created by 본프, 수꿍 on 2022/05/16.
//
struct Queue<Element> {
    private var enqueueStack: [Element] = []
    private var dequeueStack: [Element] = []
    var isEmpty: Bool {
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }
    
    var count: Int {
        return enqueueStack.isEmpty ? dequeueStack.count : enqueueStack.count
    }
    
    var peek: Element? {
        return dequeueStack.isEmpty ? enqueueStack.first : dequeueStack.last
    }

    mutating func enqueue(_ element: Element) {
        enqueueStack.append(element)
    }

    mutating func dequeue() -> Element? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }

        return dequeueStack.popLast()
    }

    mutating func clear() {
        enqueueStack.removeAll()
        dequeueStack.removeAll()
    }
}
