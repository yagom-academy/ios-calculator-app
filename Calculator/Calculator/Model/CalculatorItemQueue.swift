//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Kiwi on 2022/05/17.
//

struct CalculatorItemQueue<T>: CalculateItem{
    private var list = Linkedlist<T>()
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    mutating func enqueue(data: T) {
        list.append(data: data)
    }
    
    mutating func dequeue() -> T? {
        list.removeFirst()
    }
    
    mutating func removeAll() {
        list.removeAll()
    }
}
