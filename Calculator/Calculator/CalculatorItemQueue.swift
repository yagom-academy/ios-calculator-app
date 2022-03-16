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
    var isEmpty: Bool { linkdeList.isEmpty }
    var count: Int { linkdeList.count }
    
    func enqueue(_ data: T) {
        linkdeList.append(data)
    }
    
    @discardableResult
    func dequeue() -> T? {
        return linkdeList.removeFirst()
    }
    
    func removeAll() {
        linkdeList.removeAll()
    }
    
    func getAllData() -> [T]? {
        guard let value = linkdeList.getAllData() else { return nil }
        return value
    }
}
