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
        
        if let number = item as? NumberItem {
            queueList.append(number)
        }
        
        if let opearator = item as? OperatorItem {
            queueList.append(opearator)
        }
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

struct NumberItem: CalcultorItem {
    let data: String
}

enum OperatorItem: CalcultorItem {
    case add
    case substract
    case multiple
    case divide
}

protocol CalcultorItem { }
