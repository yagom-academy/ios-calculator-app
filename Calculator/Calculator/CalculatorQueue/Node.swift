//
//  Node.swift
//  Calculator
//
//  Created by Borysarang, Yeton on 2022/05/18.
//
class Node<T: CalculatorItem> {
    var value: T
    var next: Node<T>?
    
    init(value: T) {
        self.value = value
        self.next = nil
    }
}
