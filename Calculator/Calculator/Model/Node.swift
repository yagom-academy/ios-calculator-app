//
//  Node.swift
//  Calculator
//
//  Created by Daehoon Lee on 2023/05/30.
//

final class Node<T> {
    let data: T
    let next: Optional<T>
    
    init(data: T, next: Optional<T>) {
        self.data = data
        self.next = next
    }
}
