//
//  Node.swift
//  Calculator
//
//  Created by Derrick kim on 2022/05/17.
//

import Foundation

final class Node<T: Equatable> {
    var value: T
    var previous: Node<T>?
    var next: Node<T>?
    
    init(value: T) {
        self.value = value
    }
}
