//
//  Node.swift
//  Calculator
//
//  Created by 황제하 on 2021/11/09.
//

import Foundation

class Node: Equatable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.value == rhs.value
    }
    
    var value: Int
    
    init(value: Int = 5) {
        self.value = value
    }
}
