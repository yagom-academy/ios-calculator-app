//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by EtialMoon on 2023/05/30.
//

struct CalculatorItemQueue<Element: CalculateItem> {
    private(set) var enqueuedCalculatorItems: [Element] = []
    
    init() {}
    
    init(_ enqueuedCalculatorItems: [Element]) {
        self.enqueuedCalculatorItems = enqueuedCalculatorItems
    }
}
