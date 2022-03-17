//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 이시원 on 2022/03/15.
//

import Foundation

protocol CalculateItem {
    
}

extension Int: CalculateItem {
    
}

struct CalculatorItemQueue<L: List> {
    private let linkdeList: L
    var isEmpty: Bool { linkdeList.isEmpty }
    var count: Int { linkdeList.count }
    
    init(_ list: L) {
        self.linkdeList = list
    }
    
    func enqueue(_ data: L.T) {
        linkdeList.append(data)
    }
    
    @discardableResult
    func dequeue() -> L.T? {
        return linkdeList.removeFirst()
    }
    
    func removeAll() {
        linkdeList.removeAll()
    }
}
