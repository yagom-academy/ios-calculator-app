//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by yyss99, Serena on 2023/06/03.
//

struct CalculatorItemQueue<T: CalculateItem> {
    private var head: CalculatorItemNode<T>?
    private var tail: CalculatorItemNode<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var count: Int = 0
   
    mutating func enqueue(_ element: T) {
        let newNode = CalculatorItemNode(value: element)
        
        if head == nil {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            tail = newNode
        }
        count += 1
    }
    
    mutating func dequeue() -> T? {
        guard let firstNode = head else { return nil }
        head = firstNode.next
        
        if head == nil {
            tail = nil
        }
        count -= 1
        return firstNode.value
    }
    
    mutating func clear() {
        head = nil
        tail = nil
        count = 0
    }
}
