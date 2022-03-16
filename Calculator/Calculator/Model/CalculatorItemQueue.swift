//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by DuDu on 2022/03/14.
//

import UIKit

struct CalculatorItemQueue<Element: CalculateItem> {
    let list = LinkedList<Element>()
    
    var isEmpty: Bool {
        return list.isEmpty
    }
}


