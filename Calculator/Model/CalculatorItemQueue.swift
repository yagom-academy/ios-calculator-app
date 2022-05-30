//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by NAMU on 2022/05/17.
//

struct CalculatorItemQueue<T>: CalculateItem {
    private var linkedList = LinkedList<T>()
    
    func peek() -> T? {
        linkedList.peek()
    }
    
    mutating func enqueue(data: T) {
        linkedList.append(data: data)
    }
    
    mutating func dequeue() -> T? {
        return linkedList.removeFirst()
    }
    
    func isEmpty() -> Bool {
        linkedList.isEmpty()
    }
    
    mutating func removeAll() {
        linkedList.removeAll()
    }
}
