//
//  CalculateItemQueue.swift
//  Calculator
//
//  Created by 권나영 on 2021/11/09.
//

import Foundation

struct CalculateItemQueue<T> {
   var items: [T] = []
   
   mutating func enqueue(element: T) {
       items.append(element)
   }
   mutating func dequeue() -> T? {
       if items.isEmpty {
           return nil
       }
       return items.removeFirst()
   }
}
