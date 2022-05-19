//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by NAMU on 2022/05/17.
//

struct CalculatorItemQueue<T>: CalculatorItem {
    private var list = LinkedList<T>()
    
    func peek() -> T? {
        return list.peek()
    }
    
    mutating func enqueue(data: T) {
        list.append(data: data)
    }
    
    mutating func dequeue() -> T? {
        return list.removeFirst()
    }
    
    func isEmpty() -> Bool {
        return list.isEmpty()
    }
    
    mutating func removeAll() {
        list.removeAll()
    }
}
