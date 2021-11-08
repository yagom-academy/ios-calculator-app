//
//  LinkedListQueue.swift
//  Calculator
//
//  Created by 이아리 on 2021/11/08.
//

import Foundation
import UIKit

struct LinkedListQueue<Element> {
    private(set) var list = LinkedList<Element>()
    
    var count: Int {
        return list.count
    }
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    var front: Element? {
        return list.first?.value
    }
    
    func enqueue(_ element: Element) {
        list.append(element)
    }
    
    @discardableResult
    func dequeue() -> Element? {
        if list.isEmpty { return nil }
        return list.removeFirst()
    }
    
    func clear() {
        list.removeAll()
    }
}
