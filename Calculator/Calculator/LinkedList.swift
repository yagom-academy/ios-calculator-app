//
//  LinkedList.swift
//  Calculator
//
//  Created by 이은찬 on 2022/05/17.
//

import Foundation

class Node<T> {
    let value: T
    var next: Node?
    
    init(_ value: T) {
        self.value = value
    }
}

struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    var count: Int = 0
    
    var isEmpty: Bool {
        return self.head == nil
    }

}
