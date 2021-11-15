//
//  Node.swift
//  Calculator
//
//  Created by 이호영 on 2021/11/15.
//

import Foundation

class Node {
    var data: CalculateItem
    var next: Node?
    
    init(data: CalculateItem, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}
