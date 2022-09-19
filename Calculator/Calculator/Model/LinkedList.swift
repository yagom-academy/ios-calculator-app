//
//  Node.swift
//  Calculator
//
//  Created by 맹선아 on 2022/09/19.
//

import Foundation

class Node <T> {
    var data: T?
    var next: Node?
    
    init (data: T?, next: Node? = nil) {
        self .data = data
        self .next = next
    }
}

struct LinkedList <Value>{
    var head: Node<Value>?
    
    func append(_ data: Node<Int>) {
        
    }
}



