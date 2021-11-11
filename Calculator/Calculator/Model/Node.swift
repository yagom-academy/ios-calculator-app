//
//  Node.swift
//  Calculator
//
//  Created by JeongTaek Han on 2021/11/11.
//

import Foundation

class Node<T> {
    var item: T
    var next: Node?
    var previous: Node?
    
    init(_ item: T, _ next: Node?, _ prev: Node?) {
        self.item = item
        self.next = next
        self.previous = prev
    }
    
    convenience init(_ item: T, prev: Node?) {
        self.init(item, nil, prev)
    }
    
    convenience init(_ item: T) {
        self.init(item, nil, nil)
    }
}
