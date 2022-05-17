//
//  CalculatorList.swift
//  Calculator
//
//  Created by 유한석 on 2022/05/17.
//
class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

class CalculatorList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    init(head: Node<T>? = nil) {
        self.head = head
        self.tail = head
    }
}
