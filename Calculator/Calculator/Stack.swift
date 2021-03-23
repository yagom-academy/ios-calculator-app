//
//  Stack.swift
//  Calculator
//
//  Created by 천수현 on 2021/03/23.
//

import Foundation
class Stack {
    
    static var shared = Stack()
    private var stack = Array<Int>()
    lazy private(set) var top = stack.last
    lazy private(set) var bottom = stack.first
    
    func push(_ newElement: Int) {
        
    }
    
    func pop(_ newElement: Int) {
        
    }
    
}
