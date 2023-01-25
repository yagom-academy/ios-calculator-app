//  Calculator - Node.swift
//  created by vetto on 2023/01/24

class Node<T: CalculatorItemProtocol> {
    let data: T?
    var next: Node<T>?
    
    init(data: T?, next: Node<T>? = nil) {
        self.data = data
        self.next = next
    }
}
