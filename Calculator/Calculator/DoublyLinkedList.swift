//
//  DoublyLinkedList.swift
//  Calculator
//
//  Created by Jaehun Lee on 2/6/24.
//

protocol DoublyLinkedListProtocol {
    
}

struct DoublyLinkedList<Element>: DoublyLinkedListProtocol {
    private var header: Node<Element>
    private var trailer: Node<Element>
    private var _count: Int = 0
    
    init() {
        self.header = Node(element: nil)
        self.trailer = Node(element: nil)
        
        header.setNext(node: trailer)
        trailer.setPrev(node: header)
    }
}
