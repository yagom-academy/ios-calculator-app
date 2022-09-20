//
//  Calculator - ViewController.swift
//  Created by inho.
//  Copyright © yagom. All rights reserved.
//

import Foundation

protocol CalculateItem {
    
}

class CalculatorItemQueue<T>: CalculateItem {
    private var head: Node<T>? = nil
}

class Node<T> {
    var data: T?
    var next: Node?
    
    init(data: T?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}
