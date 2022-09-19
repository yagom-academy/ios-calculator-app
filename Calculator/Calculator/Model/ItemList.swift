//
//  ItemList.swift
//  Calculator
//
//  Created by 이정민 on 2022/09/19.
//

struct ItemList {
    private var head: Node?
    private var tail: Node?
    
    mutating func enqueue(_ data: String) {
        let newNode = Node(data: data)

        if isEmpty() {
            self.head = newNode
        }
        
        self.tail = newNode
    }
    
    mutating func dequeue() -> String? {
        guard let head = self.head else {
            return nil
        }
        
        let data = head.data
        
        return data
    }
    
    mutating func clearQueue() {
        self.head = nil
        self.tail = nil
    }
    
    func isEmpty() -> Bool {
        self.head == nil ? true : false
    }
}
