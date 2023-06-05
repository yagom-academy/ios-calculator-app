//
//  Item.swift
//  Calculator
//
//  Created by Hyungmin Lee on 2023/06/01.
//

final class Item<Element: CalculateItem> {
    var next: Item?
    var element: Element
    
    init(_ element: Element) {
        self.element = element
    }
}
