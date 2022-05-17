//
//  Node.swift
//  Calculator
//
//  Created by 유한석 on 2022/05/18.
//
class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T) {
        self.value = value
        self.next = nil
    }
}
