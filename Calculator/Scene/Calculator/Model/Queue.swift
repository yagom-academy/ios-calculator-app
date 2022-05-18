//
//  Queue.swift
//  Calculator
//
//  Created by 이은찬 on 2022/05/16.
//
class Queue<T: CalculateItem> {
    private var list = LinkedList<T>()
    
    public var count: Int {
        return list.count
    }
    
    public var isEmpty: Bool {
        return list.isEmpty
    }
    
    public var firstValue: T? {
        return list.returnFirst()?.value
    }
    
    public func enqueue(_ element: T) {
        list.append(element)
    }
    
    public func dequeue() -> T? {
        return isEmpty ? nil : list.removeHead()?.value
    }
    
    public func removeAll() {
        list.removeAll()
    }
}
