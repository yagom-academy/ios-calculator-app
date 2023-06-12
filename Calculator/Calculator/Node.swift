//
//  Node.swift
//  Calculator
//
//  Created by redmango1446 on 2023/06/01.
//

final class Node<Element> {
    var data: Element?
    var next: Node?
    
    init(data: Element?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}
