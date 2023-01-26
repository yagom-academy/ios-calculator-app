//  Calculator - CalculatorItemQueue.swift
//  created by vetto on 2023/01/25

struct CalculatorItemQueue<Element: CalculateItem> {
    private var head: Node<Element>?
    private var tail: Node<Element>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func enqueue(data: Element) {
        let node = Node(data: data)
        if head == nil {
            head = node
            tail = node
        } else {
            tail?.next = node
            tail = node
        }
    }
    
    mutating func dequeue() -> Element? {
        guard let node = head else {
            return nil
        }
        self.head = head?.next
        return node.data
    }
    
    mutating func clear() {
        self.head = nil
        self.tail = nil
    }
}
