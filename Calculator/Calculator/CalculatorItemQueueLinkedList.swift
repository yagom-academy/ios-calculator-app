//
//  CalculatorItemQueueLinkedList.swift
//  Calculator
//
//  Created by jyubong on 2023/10/03.
//

class CalculatorItemQueueLinkedList<T> {
    final class Node<T> {
        var value: T
        var next: Node?
        
        init(value: T) {
            self.value = value
        }
    }
    
    var head: Node<T>?
    var tail: Node<T>?
    var count: Int = 0
    
    var isEmpty: Bool {
        return count == 0 ? true : false
    }
    
    func append(_ item: T) {
        
    }
    
    func removeFirst() {
        
    }
}
