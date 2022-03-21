//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 이시원 on 2022/03/15.
//

import Foundation

struct CalculatorItemQueue<T: List> {
    private let linkdeList: T
    var isEmpty: Bool { linkdeList.isEmpty }
    var count: Int { linkdeList.count }
    
    init(_ list: T) {
        self.linkdeList = list
    }
    
    func enqueue(_ data: T.Element) {
        linkdeList.append(data)
    }
    
    @discardableResult
    func dequeue() -> T.Element? {
        return linkdeList.removeFirst()
    }
    
    func removeAll() {
        linkdeList.removeAll()
    }
}
