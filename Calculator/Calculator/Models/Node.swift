//
//  Node.swift
//  Calculator
//
//  Created by Kyo on 2022/09/19.
//

import Foundation

final class Node<T> {
    private var data: T
    private var next: Node<T>?
    
    init(_ data: T) {
        self.data = data
    }
    
    func bringNodeData() -> T {
        return self.data
    }
    
    func getNextNode() -> Node<T>? {
        return next
    }
    
    func setNextNode(node: Node<T>) {
        self.next = node
    }
}

