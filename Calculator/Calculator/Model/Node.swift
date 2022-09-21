//
//  Node.swift
//  Calculator
//
//  Created by 맹선아 on 2022/09/20.
//

import Foundation

class Node <T> {
    private var data: T?
    var next: Node?
    
    init (data: T?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}
