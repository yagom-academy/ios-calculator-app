//
//  Node.swift
//  Calculator
//
//  Created by Zion & Dasan on 2023/06/16.
//

final class Node<T> {
    var data: T
    var next: Node?
    
    init(data: T) {
        self.data = data
    }
}
