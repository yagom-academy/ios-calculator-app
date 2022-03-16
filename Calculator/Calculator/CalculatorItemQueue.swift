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

struct CalculatorItemQueue<T: CalculateItem> {
    private let linkdeList = LinkdeList<T>()
    
    func enqueue(_ data: T) {
        linkdeList.append(data)
    }
    
    func isEmpty() -> Bool {
        return linkdeList.isEmpty()
    }
    
    func count() -> Int {
        return linkdeList.count()
    }
    
    func dequeue() -> T? {
        return linkdeList.removeFirst()
    }
    
    func removeAll() {
        linkdeList.removeAll()
    }
    
    func allData() -> [T] {
        return linkdeList.allData()!
    }
}
