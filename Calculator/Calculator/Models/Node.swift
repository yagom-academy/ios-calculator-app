//
//  Node.swift
//  Calculator
//
//  Created by Kyo on 2022/09/19.
//

import Foundation

final class Node {
    var data: String
    private var next: Node?
    
    init(_ data: String) {
        self.data = data
    }
    
    func getNextNode() -> Node? {
        return next
    }
    
    func setNextNode(node: Node) {
        self.next = node
    }
}

