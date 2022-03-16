//
//  LinkedList.swift
//  Calculator
//
//  Created by DuDu on 2022/03/16.
//

struct LinkedList<Element: CalculateItem> {
    var head: Node<Element>?
    var tail: Node<Element>?
    
    var isEmpty: Bool {
        return head == nil
    }
}

