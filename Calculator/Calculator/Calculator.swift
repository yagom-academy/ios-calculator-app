//
//  Calculator.swift
//  Calculator
//
//  Created by 이호영 on 2021/11/09.
//

import Foundation

struct CalculatorItemQueue {
    var queueList: [CalcultorItem] = []
    
    mutating func append(item: CalcultorItem?) {
        guard let item = item else {
            return
        }
        queueList.append(item)
    }
    
    mutating func remove() -> CalcultorItem? {
        if queueList.isEmpty {
            return nil
        }
        let removedItem = queueList.removeFirst()
        
        return removedItem
    }
    
    mutating func clearList() {
        queueList = []
    }
}

struct numberItem: CalcultorItem {
    let number: String
}

protocol CalcultorItem { }
