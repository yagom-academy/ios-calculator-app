//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 이정민 on 2022/09/19.
//

struct CalculatorItemQueue<Item: CalculateItem> {
    private(set) var head: Node<Item>?
    private(set) var tail: Node<Item>?
    private(set) var count: Int = 0
    
    mutating func enqueue(_ data: Item) {
        let newNode = Node(data: data)

        if isEmpty() {
            self.head = newNode
        } else {
            self.tail?.next = newNode
        }
        
        self.tail = newNode
        count += 1
    }
    
    mutating func dequeue() -> Item? {
        guard let head = self.head else {
            return nil
        }
        
        let data = head.data
        self.head = self.head?.next
        count -= 1
        
        return data
    }
    
    mutating func clearQueue() {
        self.head = nil
        self.tail = nil
        count = 0
    }
    
    func isEmpty() -> Bool {
        self.head == nil ? true : false
    }
}
