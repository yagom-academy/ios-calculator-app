//
//  Node.swift
//  Calculator
//
//  Created by Seul Mac on 2021/11/22.
//

import Foundation

class Node<Element: CalculateItem> {
    
    var data: Element
    var next: Node?
    
    init(data: Element, next: Node? = nil) {
        self.data = data
        self.next = next
    }
    
}
