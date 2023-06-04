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

final class CalculatorItemQueue<T>: CalculateItem {
    private var headItem: CalculatorItemNode<T>?
    private var tailItem: CalculatorItemNode<T>?
    private var countItem: Int = 0
    
    var lastItem: T? {
        return tailItem?.value
    }
    
    var count: Int {
        return countItem
    }
    
    func enqueue(item: T) {
        let newNode = CalculatorItemNode(value: item)
        
        guard headItem != nil else {
            headItem = newNode
            tailItem = newNode
            countItem += 1
            return
        }
        
        tailItem?.next = newNode
        tailItem = newNode
        countItem += 1
    }
    
    func dequeueItem() -> T? {
        guard let currentHead = headItem else { return nil }
        
        guard currentHead.next != nil else {
            headItem = nil
            tailItem = nil
            countItem -= 1
            return currentHead.value
        }
        
        headItem = currentHead.next
        countItem -= 1
        
        return currentHead.value
    }
}
