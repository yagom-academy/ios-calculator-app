//
//  CalculatorItemQueue .swift
//  Calculator
//
//  Created by Jeremy on 2022/09/20.
//

class Node<Element> {
    var value: Element
    var next: Node?
    
    init(value: Element, next: Node? = nil) {
        self.value = value
        self.next = next
    }
    
    deinit {
        print("deinit value:\(value), next:\(next)")
    }
}

class CalculatorItemQueue<Element> {
    var head: Node<Element>?
    var tail: Node<Element>?
    
    init(head: Node<Element>? = nil) {
        self.head = head
        self.tail = head
    }
    
    func enqueue(newNode: Node<Element>) {
        if head != nil {
            tail?.next = newNode
            tail = newNode
        } else {
            head = newNode
            tail = newNode
        }
    }
    
    func dequeue() -> Node<Element>? {
        let result: Node? = head
        head = head?.next
        return result
    }
    
    func removeAll() {
        head = nil
        tail = nil
    }
}
