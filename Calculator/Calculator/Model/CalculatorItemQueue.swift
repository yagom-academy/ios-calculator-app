//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by junho lee on 2022/09/20.
//

class CalculatorItemQueue<T: CalculateItem> {
    class LinkedList<T> {
        class Node<T> {
            var value: T
            var next: Node?
            
            init(value: T, next: Node? = nil) {
                self.value = value
                self.next = next
            }
        }
        
        private var head: Node<T>?
        private var tail: Node<T>?
        
        func addLast(_ element: T) {
            guard let last = tail else {
                tail = Node(value: element)
                head = tail
                return
            }
            let newNode = Node(value: element)
            last.next = newNode
            tail = newNode
        }
        
        func removeFirst() -> T? {
            guard let first = head else {
                return nil
            }
            head = first.next
            return first.value
        }
    }
    
    private var queue: LinkedList<T> = LinkedList()
    
    func enqueue(_ element: T) {
        queue.addLast(element)
    }
    
    func dequeue() -> T? {
        return queue.removeFirst()
    }
}
