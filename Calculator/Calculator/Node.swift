//
//  Node.swift
//  Calculator
//
//  Created by Eddy on 2022/03/16.
//

import Foundation

final class Node {
    var prev: Node?
    var next: Node?
    var value: String
    
    init(value: String) {
        self.value = value
    }
}
