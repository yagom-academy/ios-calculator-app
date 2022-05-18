//
//  Queue.swift
//  Calculator
//
//  Created by 이은찬 on 2022/05/16.
//
class Queue<T: CalculateItem> {
    private var Queue = LinkedList<T>()
    
    public var count: Int {
        return Queue.count
    }
    
    public var isEmpty: Bool {
        return Queue.isEmpty
    }
    
    public var firstValue: T? {
        return Queue.returnFirst()?.value
    }
    
    public func enqueue(_ element: T) {
        Queue.append(element)
    }
    
    public func dequeue() -> T? {
        return isEmpty ? nil : Queue.removeHead()?.value
    }
    
    public func removeAll() {
        Queue.removeAll()
    }
}
