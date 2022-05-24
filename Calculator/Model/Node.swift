//
//  class Node<T>.swift
//  Calculator
//
//  Created by unchain123 on 2022/05/18.
//

import Foundation

class Node<T> {
    var data: T?
    var next: Node?
    
    init (data: T?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}
