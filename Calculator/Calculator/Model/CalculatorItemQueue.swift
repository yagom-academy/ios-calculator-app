//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Jae-hoon Sim on 2021/11/08.
//

import Foundation

struct CalculatorItemQueue<Item> {
    var list: [Item] = []
    
    mutating func enqueue(_ item: Item) {
        list.append(item)
    }
}
