//
//  Node.swift
//  Calculator
//
//  Created by kaki on 2023/01/25.
//

final class Node {
    weak var prev: Node?
    var data: CalculateItem?
    var next: Node?
    
    init(_ data: CalculateItem?) {
        self.data = data
    }
}
