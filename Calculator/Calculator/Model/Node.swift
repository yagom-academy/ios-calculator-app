//
//  Node.swift
//  Calculator
//
//  Created by 이예은 on 2022/05/17.
//

import Foundation

class Node<T: CalculateItem> {
    var data: T
    var next: Node<T>?
    
    init(_ data: T) {
        self.data = data
        self.next = nil
    }
}
