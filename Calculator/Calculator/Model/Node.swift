//
//  Node.swift
//  Calculator
//
//  Created by Jae-hoon Sim on 2021/11/09.
//

import Foundation

class Node<Value> {
    var value: Value
    var next: Node?
    
    init(_ value: Value) {
        self.value = value
    }
}
