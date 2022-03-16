//
//  Item.swift
//  Calculator
//
//  Created by 우롱차 on 2022/03/15.
//

import Foundation

//추후 기능 구현
protocol CalculateItem {
}

class Item: CalculateItem {
    var number: Float
    var operation: String
    
    init(number: Float, operation: String){
        self.number = number
        self.operation = operation
    }
}
