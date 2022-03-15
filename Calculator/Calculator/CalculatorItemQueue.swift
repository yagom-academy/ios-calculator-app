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

class CalculatorItemQueue<CalculateItem> {
    private let linkdeList = LinkdeList<CalculateItem>()
    
    func enqueue(_ data: CalculateItem) {
        linkdeList.append(data)
    }
    
    func isEmpty() -> Bool {
        return linkdeList.isEmpty()
    }
    
    func count() -> Int {
        return linkdeList.count()
    }
    
    func dequeue() -> CalculateItem? {
        return linkdeList.removeFirst()
    }
}
