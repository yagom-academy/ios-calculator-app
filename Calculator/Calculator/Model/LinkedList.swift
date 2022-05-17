//
//  LinkedList.swift
//  Calculator
//
//  Created by 이예은 on 2022/05/17.
//

import Foundation

class LinkedList<T: CalculateItem> {
    var head: Node<T>?
    var count: Int = 0
    
    func isEmpty() -> Bool {
        if head != nil {
            return false
        }
        return true
    }
}
