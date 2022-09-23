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
}

class CalculatorItemQueue<Element> {
    var head: Node<Element>?
    var tail: Node<Element>?
    
    init(head: Node<Element>? = nil) {
        self.head = head
        self.tail = head
    }
    
    func append(newNode: Node<Element>) {
        if let tail = self.tail {
            tail.next = newNode
            self.tail = tail.next
        } else {
            self.head = newNode
            self.tail = newNode
        }
    }
    
    func getFirst() -> Node<Element>? {
        let result: Node? = head
        head = head?.next
        return result
    }
    
    func removeAll() {
        self.head = nil
        self.tail = nil
    }
}
