//
//  NodeItem.swift
//  Calculator
//
//  Created by Mangdi on 2022/09/20.
//

import Foundation

class Node<T> {
    var data: T?
    var link: Node?
    
    init(data: T?, link: Node? = nil) {
        self.data = data
        self.link = link
    }
}
