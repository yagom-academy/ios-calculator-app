//
//  LinkedList.swift
//  Calculator
//
//  Created by Kiwi on 2022/05/17.
//

struct Linkedlist<T> : CalculateItem {
    private(set) var head: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    
}
