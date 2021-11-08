//
//  Calculator.swift
//  Calculator
//
//  Created by 서녕 on 2021/11/08.
//

import Foundation

class CalculatorItemQueue<T> {
    var itemQueue = [T]()
    
    init(itemQueue: [T]) {
        self.itemQueue = itemQueue
    }
    
    var isEmpty: Bool {
        itemQueue.isEmpty
    }
    
    func putToQueue(_ value: T) {
        itemQueue.append(value)
    }
    
    func getFromQueue() {
        guard isEmpty == false else {
           return print("Error: Queue가 비어있습니다.")
        }
        itemQueue.removeFirst()
    }
}

class Node {
    let value: Int
    var pointer: Node?
    
    init(value: Int, pointer: Node?) {
        self.value = value
        self.pointer = pointer
    }
}
    
class ManageLinkedList {
    var head: Node?
    
    func enQueue(value: Int) {
        if head == nil {
            head = Node(value: value, pointer: nil)
            return
        }
        
        var finderNodeOfEndNode = head
        while finderNodeOfEndNode?.pointer == nil {
            finderNodeOfEndNode = finderNodeOfEndNode?.pointer
        }
        finderNodeOfEndNode?.pointer = Node(value: value, pointer: nil)
    }
}
