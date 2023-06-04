//
//  Node.swift
//  Calculator
//
//  Created by Daehoon Lee on 2023/05/30.
//

final class Node<Data>: Nodeable {
    private let data: Data
    private var next: Node<Data>?
    
    init(data: Data, next: Node? = nil) {
        self.data = data
        self.next = next
    }
    
    func fetchData() -> Data {
        return data
    }
    
    func fetchNext() -> Node<Data>? {
        return next
    }
    
    func updateNext(_ next: Node<Data>) {
        self.next = next
    }
}
