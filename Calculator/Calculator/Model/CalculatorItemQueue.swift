//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by yyss99 on 2023/06/03.
//

final class CalculatorItemNode<T: CalculateItem> {
    var value: T
    var next: CalculatorItemNode?
    
    init(value: T) {
        self.value = value
    }
}

struct CalculatorItemQueue<T: CalculateItem> {
    private var head: CalculatorItemNode<T>?
    private var tail: CalculatorItemNode<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var count: Int {
        let count = 0
        
        return count
    }
   
    mutating func enqueue(_ element: T) {
        let newNode = CalculatorItemNode(value: element)
        
        if head == nil {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            tail = newNode
        }
    }
    
    func printValues() {
        var currentNode: CalculatorItemNode? = head
        
        while let node = currentNode {
            print(node.value)
            currentNode = node.next
        }
    }
}

extension String: CalculateItem {}
