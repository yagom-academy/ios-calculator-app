//
//  Node.swift
//  Calculator
//
//  Created by LIMGAUI on 2022/03/15.
//

import Foundation

final class Node: Equatable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.next == rhs.next && lhs.data == rhs.data
    }
    
    var data: Int?
    var next: Node?
    
    init(data: Int?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}
