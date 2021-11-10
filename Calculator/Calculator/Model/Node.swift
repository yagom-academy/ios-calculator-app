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
        print(value, "init")
        self.value = value
    }
    
    deinit {
        print(value, "deinit")
    }
}
