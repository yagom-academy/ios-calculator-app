//
//  CalculatorList.swift
//  Calculator
//
//  Created by Borysarang, Yeton on 2022/05/17.
//
class CalculatorList<T: CalculatorItem> {
    private var head: Node<T>?
    
    init(head: Node<T>? = nil) {
        self.head = head
    }
    
    func size() -> Int {
        guard var counterNode = head else {
            return 0
        }
        
        var count: Int = 1
        while counterNode.next != nil {
            count += 1
            counterNode = counterNode.next!
        }
        
        return count
    }
    
    func append(_ newNode: Node<T>) {
        guard head != nil else {
            head = newNode
            return
        }
        
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        node?.next = newNode
    }
    
    func isEmpty() -> Bool {
        if head == nil {
            return true
        } else {
            return false
        }
    }
    
    func pop() -> Node<T>? {
        guard let firstNode = head else {
            return nil
        }
        
        head = head?.next
        
        return firstNode
    }
}
