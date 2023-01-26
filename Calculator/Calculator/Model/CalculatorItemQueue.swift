//  Calculator - CalculatorItemQueue.swift
//  created by vetto on 2023/01/25

struct CalculatorItemQueue<Element: CalculateItem> {
    var head: Node<Element>?
    var tail: Node<Element>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func enqueue(newData: Node<Element>) {
        if head == nil {
            head = newData
            tail = newData
        } else {
            tail?.next = newData
            tail = newData
        }
    }
    
    mutating func dequeue() -> Element? {
        if head == nil {
            return nil
        } else {
            let node = head
            head = head?.next
            return node?.data
        }
    }
    
    mutating func clear() {
        self.head = nil
        self.tail = nil
    }
}
