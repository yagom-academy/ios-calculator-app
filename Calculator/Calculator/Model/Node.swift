//  Calculator - Node.swift
//  created by vetto on 2023/01/24

class Node<T: CalculateItem> {
    let data: T?
    var next: Node<T>?
    
    init(data: T?, next: Node<T>? = nil) {
        self.data = data
        self.next = next
    }
}
