//
//  CalculatorItemLinkedList.swift
//  Calculator
//
//  Created by Hemg on 2023/05/31.
//
final class CalculatorItemNode<T> {
    var value: T
    var next: CalculatorItemNode?
    
    init(value: T) {
        self.value = value
    }
}

final class CalculatorItemLinkedList<T>: CalculateItem {
    private var head: CalculatorItemNode<T>?
    private var tail: CalculatorItemNode<T>?
    
    func enqueueItem(item: T) {
        let newNode = CalculatorItemNode(value: item)
        
        guard head != nil else {
            head = newNode
            tail = newNode
            return
        }
        
        tail?.next = newNode
        tail = newNode
    }
    
    func dequeue() -> T? {
        guard let currentHead = head else { return nil }
        
        guard currentHead.next != nil else {
            head = nil
            tail = nil
            return currentHead.value
        }
        head = currentHead.next
        
        return currentHead.value
    }
}


