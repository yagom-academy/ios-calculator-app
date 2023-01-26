//  Calculator - CalculatorItemQueue.swift
//  created by vetto on 2023/01/25

struct CalculatorItemQueue<Element: CalculateItem> {
    var head: Node<Element>?
    var tail: Node<Element>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func enqueue(node: Node<Element>) {
        if head == nil {
            head = node
            tail = node
        } else {
            tail?.next = node
            tail = node
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
