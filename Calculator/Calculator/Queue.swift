//
//  Queue.swift
//  Calculator.swift
//
//  Created by JeongTaek Han on 2021/11/09.
//

import Foundation

protocol CalculateItem { }

class Node<T> {
    var item: T
    var next: Node?
    var prev: Node?
    
    init(_ item: T) {
        self.item = item
    }
    init(_ item: T, _ next: Node) {
        self.item = item
        self.next = next
    }
}
