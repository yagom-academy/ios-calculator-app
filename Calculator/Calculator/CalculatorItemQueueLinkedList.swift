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
}
