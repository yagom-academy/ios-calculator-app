//
//  Node.swift
//  Calculator
//
//  Created by Eddy on 2022/03/16.
//

import Foundation

final class Node<T> {
    var prev: Node<T>?
    var next: Node<T>?
    var value: T
    
    init(value: T) {
        self.value = value
    }
}
