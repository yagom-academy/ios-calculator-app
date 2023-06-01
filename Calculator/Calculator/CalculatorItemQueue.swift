//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Hyungmin Lee on 2023/05/30.
//

protocol CalculateItem { }

protocol Calculatorable {
    associatedtype Element
    
    mutating func enqueue(element: Element)
    mutating func dequeue() -> Element?
}

struct CalculatorItemQueue<Element: CalculateItem>: Calculatorable {
    var headItem: Item<Element>?
    var tailItem: Item<Element>?
    
    mutating func enqueue(element: Element) {
        let item = Item(element)
        
        if headItem == nil {
            headItem = item
            tailItem = item
            return
        }
        
        tailItem?.nextItem = item
        tailItem = item
    }
    
    mutating func dequeue() -> Element? {
        guard headItem != nil else { return nil }
        
        var prevHeadItem = headItem
        let element = headItem?.element
        
        headItem = headItem?.nextItem
        
        return element
    }
    
    func returnListValue() -> [Element]? {
        guard headItem != nil else { return nil }
        
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
