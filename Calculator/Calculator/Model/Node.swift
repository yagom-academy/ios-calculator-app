//
//  Node.swift
//  Calculator
//
//  Created by Daehoon Lee on 2023/05/30.
//

final class Node<T>: NodeType {
    private let data: T
    private var next: Node<T>?
    
    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
    
    deinit {
        print("Node deinit")
    }
    
    func fetchData() -> T {
        return data
    }
    
    func fetchNext() -> Node<T>? {
        return next
    }
    
    func updateNext(_ next: Node<T>) {
        self.next = next
    }
}
