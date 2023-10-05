//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Hisop on 2023/10/05.
//

protocol CalculateItem {
   
}

class CalculateItemNode: CalculateItem {
   var value: Double
   var operatorType: OperatorType
   var next: CalculateItemNode?
   
   init (value: Double, operatorType: OperatorType) {
       self.value = value
       self.operatorType = operatorType
   }
}

struct CalculateItemQueue {
    var head: CalculateItemNode?
    var tail: CalculateItemNode?
    
    mutating func enqueue(value: Double, operatorType: OperatorType) {
        let newNode = CalculateItemNode(value: value, operatorType: operatorType)
        if head == nil {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            tail = newNode
        }
    }
    
    mutating func dequeue() -> Double? {
        guard let headNode = head else {
            return nil
        }
        
        head = headNode.next
        if head == nil {
            tail = nil
        }
        
        return headNode.value
    }
    
    mutating func clear() {
        head = nil
        tail = nil
    }
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    func count() -> Int {
        var count = 0
        var currentNode = head
        
        while currentNode != nil {
            currentNode = currentNode?.next
            count += 1
        }
        
        return count
    }
}
