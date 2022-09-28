//
//  CalculatorItemQueue .swift
//  Calculator
//
//  Created by Jeremy on 2022/09/20.
//

class Node<Element: CalculateItem> {
    var value: Element
    var next: Node?
    
    init(value: Element, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

struct  CalculatorItemQueue<Element: CalculateItem> {
    var head: Node<Element>?
    var tail: Node<Element>?
    
    init(head: Node<Element>? = nil) {
        self.head = head
        self.tail = head
    }
    
    mutating func enqueue(data: Element) {
        if head != nil {
            tail?.next = Node(value: data)
            tail = Node(value: data)
        } else {
            head = Node(value: data)
            tail = Node(value: data)
        }
    }
    
    mutating func dequeue() -> CalculateItem? {
        let result: Node? = head
        head = head?.next
        return result?.value
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
}
