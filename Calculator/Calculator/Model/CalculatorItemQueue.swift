//  Calculator - CalculatorItemQueue.swift
//  created by vetto on 2023/01/25

struct CalculatorItemQueue<T: CalculatorItemProtocol> {
    var head: Node<T>?
    var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var size: Int {
        var count: Int = 0
        
        var node = self.head
        
        while node != nil {
            count += 1
            node = node?.next
        }
        
        return count
    }
    
    var peek: T? {
        return head?.data
    }
    
    mutating func enqueue(newData: Node<T>) {
        if head == nil {
            head = newData
            tail = newData
        } else {
            tail?.next = newData
            tail = newData
        }
    }
    
    mutating func dequeue() -> T? {
        if head == nil {
            return nil
        } else {
            let node = head
            head = head?.next
            return node?.data
        }
    }
    
    mutating func queueClear() {
        self.head = nil
        self.tail = nil
    }
}
