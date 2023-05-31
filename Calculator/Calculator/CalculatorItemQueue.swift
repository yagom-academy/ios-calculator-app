//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Hyungmin Lee on 2023/05/30.
//

protocol CalculateItem { }

final class Item<Element> {
    var nextItem: Item?
    var element: Element
    
    init(_ element: Element) {
        self.element = element
    }
}

class CalculatorItemQueue<Element: CalculateItem> {
    var headItem: Item<Element>?
    var tailItem: Item<Element>?
    
    func push(element: Element) {
        let item = Item(element)
        
        
    }
    
    func pop() {
        
    }
    
    func returnListValue() -> [Element]? {
        guard headItem == nil else { return nil }
        
        var item: Item? = headItem
        var listArray = [Element]()
        
        while item != nil {
            guard let element = item?.element else { break }
            
            listArray.append(element)
            item = item?.nextItem
        }
        
        return listArray
    }

}
