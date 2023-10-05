//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Hisop on 2023/10/05.
//

protocol CalculateItem {
   
}

class CalculateItemNode: CalculateItem {
   var value: Double
   var operatorType: OperatorType
   var next: CalculateItemNode?
   
   init (value: Double, operatorType: OperatorType) {
       self.value = value
       self.operatorType = operatorType
   }
}
