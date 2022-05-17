//
//  CalculatorList.swift
//  Calculator
//
//  Created by 유한석 on 2022/05/17.
//
class CalculatorList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    init(head: Node<T>? = nil) {
        self.head = head
        self.tail = head
    }
    
    func size() -> Int {
        guard var counterNode: Node = head else {
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
        guard tail != nil else {
            tail = newNode
            head = newNode
            return
        }
        tail?.next = newNode
        tail = tail?.next
    }
    
    func isEmpty() -> Bool{
        if head == nil {
            return true
        } else {
            return false
        }
    }
    
    func removeAll() {
        tail = nil
        head = nil
    }
    
    func pop() -> Node<T>? {
        guard let firstNode = head else {
            return nil
        }
        head = head?.next
        if size() == 0 {
            tail = nil
        }
        return firstNode
    }
}
