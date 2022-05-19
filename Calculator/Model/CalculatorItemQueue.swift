//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by NAMU on 2022/05/17.
//

struct CalculatorItemQueue<T>: CalculateItem {
    private var arrayList = [T]()
    
    func peek() -> T? {
        arrayList.first
    }
    
    mutating func enqueue(data: T) {
        arrayList.append(data)
    }
    
    mutating func dequeue() -> T? {
        arrayList.removeFirst()
    }
    
    func isEmpty() -> Bool {
        arrayList.isEmpty
    }
    
    mutating func removeAll() {
        arrayList.removeAll()
    }
}
