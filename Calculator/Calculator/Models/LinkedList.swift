//
//  LinkedList.swift
//  Calculator
//
//  Created by Toy on 10/6/23.
//

import Foundation

final class LinkedList<T> {
    final class Node<T> {
        var value: T
        var next: Node?
        
        init(value: T) {
            self.value = value
        }
    }
    
    private var head: Node<T>?
    
    var isEmpty: Bool { head == nil }
    
    var first: Node<T>? { head }
    
}
