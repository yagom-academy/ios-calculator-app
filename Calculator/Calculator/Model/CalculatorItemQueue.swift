//  Calculator - CalculatorItemQueue.swift
//  created by vetto on 2023/01/25

struct CalculatorItemQueue<T> {
    var head: Node<T>?
    var tail: Node<T>?
    var count: Int = 0
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var size: Int {
        return self.count
    }
    
    mutating func enqueue(newData: Node<T>) {
        if head == nil {
            head = newData
            tail = newData
        } else {
            tail?.next = newData
            tail = newData
        }
        self.count += 1
    }
    
    mutating func dequeue() -> T? {
        if head == nil {
            return nil
        } else {
            let node = head
            head = head?.next
            self.count -= 1
            return node?.data
        }
    }
    
    func peek() -> T? {
        if head == nil {
            return nil
        } else {
            return head?.data
        }
    }
    
    mutating func queueClear() {
        self.head = nil
        self.tail = nil
    }
}
