//
//  Node.swift
//  Calculator
//
//  Created by yeton on 2022/05/17.
//

import Foundation

class Node<T: CalculateItem> {
    private(set) var data: T
    var next: Node<T>?
    
    init(_ data: T) {
        self.data = data
        self.next = nil
    }
}
