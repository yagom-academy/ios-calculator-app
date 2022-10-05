//  CalculatorItemQueue.swift
//  Created by zhilly on 2022/09/20.

struct CalculatorItemQueue<T: CalculateItem> {
    private var head: Node<T>?
    private var tail: Node<T>?
    private(set) var count = 0
    
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func enqueue(_ element: T) {
        let newNode: Node = Node(data: element)
        count += 1
        
        if isEmpty == true {
            head = newNode
        } else {
            tail?.next = newNode
        }
        tail = newNode
    }
    
    mutating func dequeue() -> T? {
        if isEmpty == true {
            return nil
        }
        
        let data = head?.data
        head = head?.next
        count -= 1
        return data
    }
}
