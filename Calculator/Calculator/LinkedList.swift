//
//  LinkedList.swift
//  Calculator
//
//  Created by LIMGAUI on 2022/03/15.
//

import Foundation

final class LinkedList {
    var head: Node?
    var tail: Node?
    
    init(head: Node? = nil) {
        self.head = head
        self.tail = head
    }
}
