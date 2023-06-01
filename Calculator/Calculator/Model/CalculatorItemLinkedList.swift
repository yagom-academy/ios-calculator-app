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
    private var headItem: CalculatorItemNode<T>?
    private var tailItem: CalculatorItemNode<T>?
    
    func enqueueItem(item: T) {
        let newNode = CalculatorItemNode(value: item)
        
        guard headItem != nil else {
            headItem = newNode
            tailItem = newNode
            return
        }
        
        tailItem?.next = newNode
        tailItem = newNode
    }
    
    func dequeueItem() -> T? {
        guard let currentHead = headItem else { return nil }
        
        guard currentHead.next != nil else {
            headItem = nil
            tailItem = nil
            return currentHead.value
        }
        headItem = currentHead.next
        
        return currentHead.value
    }
}


