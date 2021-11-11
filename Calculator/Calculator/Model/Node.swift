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
    
    init(_ item: T, _ next: Node?, _ previous: Node?) {
        self.item = item
        self.next = next
        self.previous = previous
    }
    
    convenience init(_ item: T, previous: Node?) {
        self.init(item, nil, previous)
    }
    
    convenience init(_ item: T) {
        self.init(item, nil, nil)
    }
    
    deinit {
        print("\(item) 소멸중")
    }
}
